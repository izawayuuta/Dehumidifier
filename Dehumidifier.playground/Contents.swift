import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var isButtonPressed = true
let capacity = 10 //タンクの容量 ml
var amountWater = 9 //現在の水量 ml
var isTankRemoval = false // タンクの取り外されているか true=取り外されている
var filterNumberOfUses = 29 // フィルター使用日数
var limitFilterNumberOfUses = 30 // フィルター最大使用日数


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

if isTankRemoval {
    print("タンクが取り外されています")
} else if ( isButtonPressed && capacity == amountWater ) { // ボタンが押されて、タンクの容量と現在の水量が一致（満水）している
    print("タンクが満水なので運転できません")
} else if ( filterNumberOfUses == limitFilterNumberOfUses ) { //    print("フィルターを交換してください")
    print("フィルターを交換してください")
} else if ( capacity == amountWater) { // ボタンは押されてないけど、タンクの容量と現在の水量が一致（満水）している
    print("タンクが満水です")
} else if ( isButtonPressed && amountWater < capacity && filterNumberOfUses < limitFilterNumberOfUses) {
    print("運転を開始します")
    let alarm = Alarm()
    alarm.start()
} else {
    print("（ボタンが押されていません）")
}

