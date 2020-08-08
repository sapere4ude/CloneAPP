앱 만들떄 기본적으로 TableView 위에 CollectionView 를 깐다는 개념으로 접근해야 한다.

1. TableView 추가하기

2. 아울렛 추가하기

3. Delegate 채택하기 
 방법1.
 class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
 
 방법2.
 class ViewController: UIViewController { }
 
 
 extension ViewController: UITableViewDataSource, UITableViewDelegate { } 
 
 >> 두 방법 모두 viewController 가 UITableViewDataSource 의 프로토콜을 준수하고 있지 않기 때문에 오류가 난다. 이유는?
    UITableViewDataSource 에 정의된 optional이 붙지 않은 함수들을 구현하지 않았기 때문! optional이 붙지 않은 애들은 반드시 구현 해줘야한다.
    

4. 대리자를 위임하는 코드 작성하기
override func viewDidLoad(){
  super.viewDidLoad()
  tableView.delegate = self
  tableView.dataSource = self
}

5. TableView에 다양한 테이블을 넣고싶은 것이 목적이므로 '배열'을 만들어줘야 한다.

6. TableView는 dequeueReusableCell 메소드를 사용한다. 이를 사용하기 위해선 Cell의 identifier가 필요하다.
