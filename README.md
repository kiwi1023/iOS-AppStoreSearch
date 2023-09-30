# iOS-AppStoreSearch
## HurayPositive 과제 전형

> 수행 기간: 2023.09.28 ~ 2023.09.30
>
> 제출자: [송기원](https://github.com/kiwi1023)

## 💻 프로젝트 소개 

AppStore의 검색 화면을 itunes API를 이용하여 클론코딩을 진행한 프로젝트입니다.

### ⚙️ 개발환경 및 프레임워크
[![swift](https://img.shields.io/badge/swift-5.8-orange)]()

[![xcode](https://img.shields.io/badge/Xcode-14.3-blue)]()

<img src="https://img.shields.io/badge/SwiftUI-orange?style=flat&logo=Swift&logoColor=ffffff"/>

<img src="https://img.shields.io/badge/Combine-orange?style=flat&logo=Swift&logoColor=ffffff"/>

## 📜 프로젝트 구조 및 상세설명

### 📁 폴더 구조

|프로젝트|테스트|
|:--:|:--:|
|![스크린샷 2023-09-30 오후 1 12 44](https://github.com/kiwi1023/iOS_AppStore/assets/101521502/b6511c86-8bc9-4049-9b7c-0439102638a9)|![스크린샷 2023-09-30 오후 1 13 32](https://github.com/kiwi1023/iOS_AppStore/assets/101521502/efb863ff-eb90-40f4-94a5-cf3c35467d14)|


### ⚒️ Architecture
![AppSearch (3)](https://github.com/kiwi1023/iOS_AppStore/assets/101521502/049f2276-3717-459f-8fee-62b581761a50)

> **Note❗️**
> 
> **MVVM을 선택한 이유?**
> 
> https://gist.github.com/unnnyong/439555659aa04bbbf78b2fcae9de7661 <- 해당 글을 보면, SwiftUI에서는 View가 자체적으로 Data Binding이 가능한 PropertyWrapper를 지원해주기 때문에 MVVM의 사용을 지양하자고 주장하고 있습니다.
> 하지만 개인적으로 MVVM의 목적이 DataBinding을 하기 위함이 아니라 MVVM을 구현(View와 ViewModel의 분리)하기 위해 DataBinding을 사용한다고 생각합니다. 그럼으로써 ViewLifeCycle과 관계없는 TestTable한 코드가 되기 때문입니다. 그렇기 때문에 DataBinding을 이미 제공하기 때문에 MVVM의 사용을 지양하자는 주장은 저에게 크게 다가 오지 않았습니다. 또한 @ObservableObject를 사용한 MVVM의 구현은 오히려 (UIkit에서 bind 구현에 비해)DataBinding을 좀더 간편하게하고 효율적이라고 생각했습니다. 물론 SwifUI에 가장 완벽히 부합하는 패턴이 MVVM이라는 뜻은 아닙니다만, 여전히 충분히 좋은 패턴이라고 생각했습니다.

### 📋 UnitTest

#### NetworkServiceTest
<img width="946" alt="스크린샷 2023-09-28 오전 12 39 52" src="https://github.com/kiwi1023/iOS_AppStore/assets/101521502/67cfb715-4c68-466b-99a7-e0352874d649">

네트워크 환경과 상관없는 테스트가 가능하게 하기 위해 비동기 처리를 하는 StubManager를 생성하고 expectation을 사용하여 비동기 테스트가 가능하게 하였습니다.

#### ViewModelTest
<img width="500" alt="스크린샷 2023-09-28 오전 12 46 22" src="https://github.com/kiwi1023/iOS_AppStore/assets/101521502/6f125b56-2933-4fac-be29-30d1280ea44e">

Excutions를 구현하여 행위 기반 테스트(behavior base test - 객체가 특정 동작을 수행했는지 확인)를 가능하게 했고, 가상의 배열을 주입하여 상태 기반 테스트(state base test - 객체의 상태가 변했는지 확인) 또한 진행하였습니다.

## 📱 실행화면
|추천검색어|검색기록 삭제|검색|앱 상세 화면|
|:--:|:--:|:--:|:--:|
|<img src = "https://github.com/kiwi1023/iOS_AppStore/assets/101521502/18d1ac14-3606-4a07-9acf-8ccf16f1e675" width="180">|<img src = "https://github.com/kiwi1023/iOS_AppStore/assets/101521502/d5925062-5e52-49a8-a965-9e599007d46d" width="180">|<img src = "https://github.com/kiwi1023/iOS_AppStore/assets/101521502/107fbd15-d8ce-4e60-aeb4-259b9977e0b9" width="180">|<img src = "https://github.com/kiwi1023/iOS_AppStore/assets/101521502/d420106f-2e5d-41ad-a40d-091b6e4f4397" width="180">|
