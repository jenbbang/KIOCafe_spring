# 🥐 KIOBakery Cafe 🥐
#### 📅 2022년 8월 ~ 2022년 9월



## 📢 개요
KIOBakery Cafe는 작은 카페의 메뉴를 소개하고 주문을 온라인으로 처리할 수 있는 웹 애플리케이션입니다. </br>
소규모 베이커리 카페를 콘셉트로 하여, 회원 가입, 로그인, 장바구니, 결제, 주문 조회 등 다양한 기능을 제공합니다.</br>
이 프로젝트는 백엔드 개발자 4명이 협력하여 개발되었습니다.


## 💥 주요 기능
  
| 기능 영역 | 세부 기능 |
| --- | --- |
| 고객 포털 | 👤 **회원 가입** <br> 🔐 **로그인** <br> 🚪 **로그아웃** <br> 📝 **정보 수정** <br> ❌ **회원 탈퇴** |
| 메뉴 관리 | 🥖 **베이커리 메뉴**: 등록, 수정, 삭제 <br> ☕ **드링크 메뉴**: 등록, 수정, 삭제 |
| 주문 관리 | 🛒 **장바구니**: 상품 추가, 삭제 <br> 💳 **결제**: 결제 진행, 결제 취소 |
| 주문 조회 | 📜 **주문 현황 조회** <br> 📦 **주문 상세 조회** |


## 🛠️ 기술 스택
![Spring](https://img.shields.io/badge/Framework-Spring-6DB33F?style=flat-square&logo=spring&logoColor=white)
![MyBatis](https://img.shields.io/badge/Framework-MyBatis-000000?style=flat-square&logo=mybatis&logoColor=white)
![HTML5](https://img.shields.io/badge/Language-HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/Language-CSS3-1572B6?style=flat-square&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/Language-JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=white)
![jQuery](https://img.shields.io/badge/Library-jQuery-0769AD?style=flat-square&logo=jquery&logoColor=white)
![AJAX](https://img.shields.io/badge/Library-AJAX-2D9BEF?style=flat-square&logo=ajax&logoColor=white)
![Servlets](https://img.shields.io/badge/Technology-Servlets%20%26%20JSP-4B8BBE?style=flat-square&logo=java&logoColor=white)
![Java](https://img.shields.io/badge/Language-Java-007396?style=flat-square&logo=java&logoColor=white)
![Oracle](https://img.shields.io/badge/Database-Oracle-F80000?style=flat-square&logo=oracle&logoColor=white)

## ERD (Entity-Relationship Diagram)
<p align="left">
<img src="https://postfiles.pstatic.net/MjAyNDA3MzFfOTYg/MDAxNzIyMzk1MDQxMzUw.T_8-bDg9PlYVzPD1CVHzL3XmBljhjEd5b1oZ3ROGAGEg.Fvz1RV12K2FC7Q1G1kw-c1jt4PNs_lMvZuAatt3DyZMg.PNG/2569e0c9-7834-43f6-b0ef-c511b625b983.png?type=w773">
</p>



## 📄 프로젝트 하이라이트

### 1. 사용자 친화적인 인터페이스 설계

#### 1.1 주요 특징  
- **메인 페이지**: 메뉴 소개 및 주문 기능을 한눈에 볼 수 있도록 디자인
- **회원 관리**: 가입, 로그인, 정보 수정, 탈퇴 기능 제공

#### 1.2 페이지 구성
  
| 페이지 | 기능 |
| --- | --- |
| 메인 페이지 | 메뉴 소개, 링크 제공 |
| 베이커리 메뉴 | 상품 등록, 수정, 삭제 |
| 드링크 메뉴 | 상품 등록, 수정, 삭제 |
| 장바구니 | 상품 추가, 삭제, 수량 조절 |
| 결제 페이지 | 결제 진행, 결제 취소 |
| 주문 조회 | 주문 현황 및 상세 조회 |

#### 1.3 구현 내용 

- **문제점**
    - **데이터 정규화** : 데이터 중복으로 인해 데이터베이스 품질 저하 및 비효율적 자원 사용
    - **서버 부하** : 데이터 처리 성능 저하로 인한 서버 부하 증가

- **해결 방법**
    - **데이터 정규화** : 데이터 중복 제거를 통해 데이터베이스 품질 향상
    - **서버 최적화** : 효율적인 데이터 처리 및 쿼리 최적화

- **결과**
    - **접근성 향상**: 직관적인 인터페이스 제공으로 사용자 만족도 증가
    - **성능 개선**: 데이터 처리 속도 향상으로 사용자 경험 개선 및 서버 부하 감소
  
### 🔥 트러블 슈팅 
- **이슈**: 결제 처리 중 오류 발생
- **해결**: 결제 API 연동 문제 해결 및 결제 프로세스 개선

### 💭 기술적 의사 결정 
- **기술 선택**: Spring Boot와 MyBatis를 사용하여 빠른 개발 및 유지보수 용이성 확보

## ⚙️ 프로젝트 설정
| 설정 영역 | 세부 내용 |
| --- | --- |
| 🌱 Spring Boot 설정 | Spring Initializr를 사용하여 프로젝트 생성 <br> 필요한 의존성을 Gradle에 추가 |
| 🗄️ 데이터베이스 설정 | 애플리케이션 프로퍼티 파일을 통해 데이터베이스 연결 설정 |
| 🌐 HTTP Request / Response | REST 컨트롤러 작성하여 클라이언트와 서버 간 통신 처리 |

## ⚙️ 설치 및 실행 방법
### 사전 요구 사항

![JDK 11](https://img.shields.io/badge/JDK-11-blue)
![Gradle](https://img.shields.io/badge/Build%20Tool-Gradle-02303A?style=flat-square&logo=gradle&logoColor=white)
![MySQL](https://img.shields.io/badge/DB-MySQL-4479A1?style=flat-square&logo=mysql&logoColor=white)

### 설치
1. 프로젝트를 클론
    ```bash
    git clone https://github.com/yourusername/KIOBakeryCafe.git
    cd KIOBakeryCafe
    ```

2. 의존성을 설치
    ```bash
    ./gradlew clean build
    ```

3. 애플리케이션을 실행
    ```bash
    ./gradlew bootRun
    ```

