import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var isButtonPressed = true
let capacity = 10 //タンクの容量 ml
var amountWater = 0 //現在の水量 ml
var isTankRemoval = false // タンクの取り外されているか true=取り外されている
var filterNumberOfUses = 29 // フィルター使用日数
let limitFilterNumberOfUses = 30 // フィルター最大使用日数

class Dehumidifier {
    
    var timer: Timer?
    var count: Int = 0
    var limit: Int = 10
    var isButtonPressed: Bool
    let capacity = 10
    var amountWater: Int
    var isTankRemoval: Bool
    var filterNumberOfUses: Int
    let limitFilterNumberOfUses = 30
    
    init(isButtonPressed: Bool, amountWater: Int, isTankRemoval: Bool, filterNumberOfUses: Int) {
        self.isButtonPressed = isButtonPressed
        self.amountWater = amountWater
        self.isTankRemoval = isTankRemoval
        self.filterNumberOfUses = filterNumberOfUses
    }
    
    func checkStatus() {
        if isTankRemoval {
            print("タンクが取り外されています")
        } else if ( isButtonPressed && capacity == amountWater ) {
            print("タンクが満水なので運転できません")
        } else if ( filterNumberOfUses >= limitFilterNumberOfUses ) {
            print("フィルターを交換してください")
        } else if ( amountWater >= capacity ) {
            print("タンクが満水です")
        } else if ( isButtonPressed && amountWater < capacity && filterNumberOfUses < limitFilterNumberOfUses ) {
            print("運転を開始します")
            start()
        } else {
            print("（ボタンが押されていません）")
        }
    }
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
        amountWater += 1
        print("\(amountWater)ml")
        if amountWater >= capacity {
            print("満水になりました⚠️運転を停止します")
            timer?.invalidate()
        }
    }
}
let dehumidifier = Dehumidifier(isButtonPressed: isButtonPressed, amountWater: amountWater, isTankRemoval: isTankRemoval, filterNumberOfUses: filterNumberOfUses)
dehumidifier.checkStatus()



