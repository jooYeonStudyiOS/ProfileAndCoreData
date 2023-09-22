# ProfileAndCoreData

## UserDefaults와 CoreData의 차이점

데이터를 저장하고 관리하는 방법이지만 아래와 같은 차이점이 있다.  

* UserDefaults는 key-value 형태로 데이터를 저장
* CoreData는 DB처럼 Column과 Record의 형태로 저장  

* UserDefaults는 사용함에 있어 매우 복잡하다는 느낌을 받았는데 이유는 사용할 때 파싱해줘야하는 부분도 많았고, 레코드 하나하나를 객체로 관리하는 CoreData와 달리 규모가 커지면 커질수록 파악하기 데이터를 자세히 파악하는 것이 어려웠다. 따라서 bool같은 소규모 데이터를 저장하는 데 어울린다고 생각했다
* CoreDat는 엑스코드 내에서 자동으로 생성해주는 부분이 많았기 때문에 사용할 때 편리했고, CURD와 관련해서도 마치 SQL을 쓰는 것 같은 느낌이어서 사용할 때 UserDefaults보다 편리하다는 인상을 받았다. 따라서 대규모 데이터를 관리하는 것도 문제 없을 것 같다고 생각했다. 

## MVC를 목표로 구현했던 숙련 과제와 MVVM을 구현했던 `ProfileViewController`를 비교해보세요.
MVC의 경우, View(ViewController)의 코드 길이가 점점 길어진다는 생각을 많이 했고, model 처리와 좀 겹치는 부분이 있는데? 라는 생각을 하면서 진행했는데 MVVM으로 구현한 ProfileViewController의 Veiw는 확실히 사용자가 보는 부분만 관리한다는 인상을 받았다. 

## 아래 ViewController를 기준으로 구조를 설명해주세요(각 기능별관계는 없어도 됩니다.)
    
이번 과제는 UI&MVVM 과 데이터 일관성 두 개의 파트로 나눠져 있었기 때문에 메인 화면에서 각각의 과제를 수행한 화면으로 이동할 수 있도록 했습니다.
메인 화면에서 go profile버튼틀 누르면 UI&MVVM 과제 페이지로, go core data버튼을 누르면서 데이터 일관성 과제 페이지도 이동하며, 각각의 페이지는 스토리보드를 새롭게 추가했습니다. 

### UI&MVVM 과제 페이지
UI 페이지 와 MVVM 페이지로 나뉘며, 구조는 아래와 같습니다.

UI 페이지 : Main이 되는 ProfileDesignViewController가 있고, 필요에 따라 SubView를 추가하는 형식으로 진행. 오토레이아웃은 snpkit을 사용
MVVM 페이지
- model : 파일명(UserProfile), userName, userAge 두 개의 프로퍼티가 있습니다.
- ViewModel : 파일명(ProfileViewModel) UserProfile을 바인딩했습니다
- View : 파일명(ProfileViewController) ViewModel 객체를 만들어서 Model을 사용할 수 있도록 했습니다.
- UI&MVVM 과제 페이지의 메인 페이지(ProfileMainViewController)에서 이동시, UserProfile 객체를 만들고 만들어진 객체를 ViewModel을 통해 View에 알리는 형식으로 사용했습니다.

### 데이터 일관성 과제 페이지
CoreDataManager에서 CoreData의 CRUD를 모두 관리하게 했고, 싱글톤으로 설정했습니다.
CoreData를 사용하는 페이지에서는 CoreDataManager 객체를 만들어서 해당 처리 함수를 부르는 형태로 구현했습니다.



