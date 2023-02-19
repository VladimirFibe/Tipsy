#  Tipsy

![](/img/1.png)

```swift
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UIViewController()
        return true
    }
}
```

Скачиваем [проект](https://github.com/appbrewery/Tipsy-iOS13-Completed)

Открываем проект и перетягиваем иконку приложения (1024pt)

![](/img/2.png)

Начнем с цвета фонаюююю

![](/img/3.png)

Перетягиваем цвет в код
![](/img/4.png)

![](/img/5.png)

![](/img/6.png)

```swift
    let enterBillTotal = UILabel()
    let billTextField = UITextField()
    lazy var titleStack = UIStackView(arrangedSubviews: [enterBillTotal, billTextField])
```

```swift
    func setupViews() {
        view.addSubview(titleStack)
    }
```

```swift
    func layoutViews() {
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: titleStack.trailingAnchor, constant: 50)
        ])
    }
```

```swift
    func configureAppearance() {
        configureColos()
        enterBillTotal.text = "Enter bill total"
        enterBillTotal.font = .systemFont(ofSize: 25)
        
        billTextField.placeholder = "e.g. 12356"
        billTextField.textAlignment = .center
        billTextField.font = .systemFont(ofSize: 40)
        
        titleStack.axis = .vertical
        titleStack.spacing = 26
    }
```
![](/img/8.png)

![](/img/7.png)

![](/img/9.png)
