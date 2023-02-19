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

Начнем с цвета фона

![](/img/3.png)

Перетягиваем цвет в код
![](/img/4.png)
