# 🚗RecCar 자동차 손상 관리 서비스

### 프로젝트 진행 기간

2023.02.27(월) ~ 2023.04.07(금)

## Team Members

<div align="left">
  <table>
    <tr>
        <td align="center">
        <a href="">
          <img src="./assets/ch.PNG" alt="김창현 프로필" width=120 height=120 />
        </a>
      </td>
      <td align="center">
        <a href="">
          <img src="./assets/hero.jpg" alt="김영웅 프로필" width=120 height=120 />
        </a>
      </td>
      <td align="center">
        <a href="">
          <img src="./assets/tk.jpg" alt="김태균 프로필" width=120 height=120 />
        </a>
      </td>
      <td align="center">
        <a href="">
          <img src="./assets/sh.png" alt="원송희 프로필" width=120 height=120 />
        </a>
      </td>
      <td align="center">
        <a href="">
          <img src="./assets/dh.jpg" alt="임두현 프로필" width=120 height=120 />
        </a>
      </td>
      <td align="center">
        <a href="">
          <img src="./assets/jy.jpg" alt="임주연 프로필" width=120 height=120 />
        </a>
      </td>
    </tr>
    <tr>
      <td align="center">
        <a href="https://github.com/variety82/">
          김창현
        </a>
      </td>
      <td align="center">
        <a href="https://github.com/Woong1201">
          김영웅
        </a>
      </td>
      <td align="center">
        <a href="https://github.com/TannyKim">
          김태균
        </a>
      </td>
      <td align="center">
        <a href="https://github.com/songheewon">
          원송희
        </a>
      </td>
      <td align="center">
        <a href="https://github.com/ldhldh07">
          임두현
        </a>
      </td>
        <td align="center">
        <a href="">
          임주연
        </a>
      </td>
    </tr>
  </table>
</div>



## 🚦등장 배경

관광지, 휴가 등에서 자동차 렌트 서비스 이용 후 과도한 위약금, 사고 발생 후 수리비, 면책금 부과 등 분쟁을 겪으신 적이 있으신가요?   ~~~~ 머시기머시기기 ㅣ기기기기

### 당신의 소중한 여행, 휴가가 되도록 저희 RecCar가 지켜드리겠습니다 

## 개요

## Usage

```
git clone https://lab.ssafy.com/s08-ai-image-sub2/S08P22A102.git
이후 exec폴더의 포팅메뉴얼을 따라 진행
```

### 개발환경



## Product Flow

![Product Flow](./assets/Flowchart.png)

## Service Architecture

![Architecture](./assets/Architecture.png)



### 📂디렉토리 구조


<details>
  <summary>
  백엔드 디렉토리 구조
  </summary>


    ├─main
    │  ├─java
    │  │  └─com
    │  │      └─heros
    │  │          ├─api
    │  │          │  ├─calendar
    │  │          │  │  ├─controller
    │  │          │  │  ├─dto
    │  │          │  │  │  ├─request
    │  │          │  │  │  └─response
    │  │          │  │  ├─entity
    │  │          │  │  ├─repository
    │  │          │  │  └─service
    │  │          │  ├─car
    │  │          │  │  ├─controller
    │  │          │  │  ├─dto
    │  │          │  │  │  ├─request
    │  │          │  │  │  └─response
    │  │          │  │  ├─entity
    │  │          │  │  ├─repository
    │  │          │  │  └─service
    │  │          │  ├─detectionInfo
    │  │          │  │  ├─controller
    │  │          │  │  ├─dto
    │  │          │  │  │  ├─request
    │  │          │  │  │  └─response
    │  │          │  │  ├─entity
    │  │          │  │  ├─repository
    │  │          │  │  └─service
    │  │          │  ├─example
    │  │          │  │  ├─controller
    │  │          │  │  └─model
    │  │          │  └─user
    │  │          │      ├─controller
    │  │          │      ├─dto
    │  │          │      │  ├─request
    │  │          │      │  └─response
    │  │          │      ├─entity
    │  │          │      ├─repository
    │  │          │      └─service
    │  │          ├─common
    │  │          ├─config
    │  │          └─exception
    │  │              └─customException
    │  └─resources

 </details>

<details>
  <summary>
  프론트엔드 디렉토리 구조
  </summary>


    ├─assets
    │  ├─car_video
    │  ├─fonts
    │  └─images
    │      ├─car_damage_img
    │      └─loading_img
    ├─provider
    │  └─car_damage_info_provider
    ├─screens
    │  ├─after_check_damage_screen
    │  ├─after_recording_screen
    │  ├─before_recording_screen
    │  ├─calendar_screen
    │  ├─check_car_damage_screen
    │  ├─check_video_screen
    │  ├─detail
    │  ├─home
    │  ├─login_screen
    │  ├─map_screen
    │  ├─my_page
    │  ├─register
    │  ├─splash_screen
    │  └─video_recording_screen
    ├─services
    ├─utils
    └─widgets
        ├─check_car_damage
        ├─common
        ├─detail
        ├─main_page
        ├─my_page
        └─register

 </details>

## Dataset

- AIHub 개방 데이터셋

![Architecture](./assets/dataset.PNG)

- 전체 이미지 개수 : 504,450 장 중 50,000장 사용(Train : 35,000장, Validation : 15,000장)

- 3 class : 스크래치(Scratch), 찌그러짐(Crushed), 파손(Breakage)

## Experiments

![Experiments](./assets/experiments.png)

### 🚗 **차량 파손 Segmentation**

**Task** : 차량 이미지로 부터 각 클래스에 해당하는 영역을 Segmentation

**Metric** : mIoU

| Model | Backbone | mIoU |
| ----- | -------- | ---- |
| Unet  | ResNet34 | 0.72 |



## 💡 Model Installation Guide

```
cd APP/modles
Scratch, Breakage, Crushed클래스를 학습한 모델의 pt파일이 존재합니다.
```

## 📓 Train Usage

```
1) 학습할 데이터에 맞춰 json파일을 생성해야 합니다.
학습할 데이터들을 넣고 AI/utils의 make_damage_labeling.ipynb를 실행하여 damage_labeling.csv를 생성합니다.

cd data/datainfo 위치에 앞서 학습할 데이터에 맞게 만들어놓은 damage_labeling.csv를 위치 시킨 후
cd AI위치에서 아래 명령어를 실행합니다.
python code/src/Utils.py --make_cocoformat 1 --task damage

2)Train
cd AI/code로 이동하여 아래 명령어를 실행합니다.
python main.py --train y --task damage --label all
```



## 주요기능 및 화면
