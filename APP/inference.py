import time
import torch 
import cv2
import os
import matplotlib.pyplot as plt
import matplotlib.cm as cm
import numpy as np
from src.Models import Unet


device = 'cuda' if torch.cuda.is_available() else 'cpu'
n_classes = 2


def load_model():
    #Scratch만 
    weight_path = './models/[DAMAGE][Scratch_0]Unet.pt'
    #Load pretrained model
    model = Unet(encoder='resnet34', pre_weight='imagenet', num_classes=n_classes).to(device)
    model.model.load_state_dict(torch.load(weight_path, map_location=torch.device(device)))
    model.eval()
    return model

def load_img(img_name):
    # load img
    #org_img : 원본이미지
    #img_img : 인퍼런스하기 위해 정규화 및 RGB변경
    img_path = f"./dataset/images/{img_name}"
    org_img  = cv2.imread(img_path)
    org_img = cv2.cvtColor(org_img, cv2.COLOR_BGR2RGB)
    org_img = cv2.resize(org_img, (512, 512))

    img_input = org_img / 255.
    img_input = img_input.transpose([2, 0, 1])

    img_input = torch.tensor(img_input).float().to(device)
    img_input = img_input.unsqueeze(0)

    return org_img, img_input


def inference_img(model, org_img, img_input, output_name):

    model_before = time.time()
    output = model(img_input)
    model_after = time.time()
    print(f"model time : {model_after - model_before}")

    image_save_before = time.time()
    img_output = torch.argmax(output, dim=1).detach().cpu().numpy()
    img_output = img_output.transpose([1, 2, 0])
    fig, ax = plt.subplots(nrows=1, ncols=2, figsize=(16, 10))

    ax[0].imshow(org_img)
    ax[0].set_title('car image')
    ax[0].axis('off')

    ax[1].imshow(org_img.astype('uint8'), alpha=0.9)
    ax[1].imshow(img_output, cmap=cm.Reds, alpha=0.5)
    ax[1].set_title('damage')
    ax[1].axis('off')
    fig.set_tight_layout(True)

    if not os.path.exists("./dataset/output_images"):
            os.makedirs("./dataset/output_images")

    image_save_after = time.time()
    print(f"image_save_time : {image_save_after - image_save_before}")


    # 얘가 오래걸림 ;
    plt.savefig(f'./dataset/output_images/{output_name}', dpi=50)

    return output_name

def create_images(model, images):

    created_images = []
    for img in images:
        org_img, img_input = load_img(img)

        inference_before = time.time()
        output_img = inference_img(model, org_img, img_input, f"damage_{img}")
        inference_after = time.time()

        print(f"inference time : {inference_after -inference_before}")
        created_images.append(output_img)

    return created_images