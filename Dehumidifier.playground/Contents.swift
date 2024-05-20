import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var isButtonPressed = true
let capacity = 10 //タンクの容量 ml
var amountWater = 9 //現在の水量 ml

class Alarm {
    
    var timer: Timer?
    var count: Int = 0
    var limit: Int = 10
    
    func start() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countup),
            userInfo: nil,
            repeats: true
        )
    }
    @objc func countup() {
           // 運転開始で1mlずつ増える
           count += 1
           print("\(count)ml")
        if limit == count {
           print("満水になりました⚠️運転を停止します")
           timer?.invalidate()
        }
    }
}

if ( isButtonPressed && amountWater < capacity) {
    let alarm = Alarm()
    alarm.start()
} else {
    print("（ボタンが押されていません）")
}

if ( isButtonPressed && capacity > amountWater ) { // ボタンが押されて、タンクの容量が現在の水量より多い
    print("運転を開始します")
} else if ( isButtonPressed && capacity == amountWater ) { // ボタンが押されて、タンクの容量と現在の水量が一致（満水）している
    print("タンクが満水なので運転できません")
} else if ( isButtonPressed || capacity == amountWater) { // ボタンは押されてないけど、タンクの容量と現在の水量が一致（満水）している
    print("タンクが満水です")
} else {
}

