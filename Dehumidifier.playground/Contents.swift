var isButtonPressed = true
let capacity = 10000 //タンクの容量 ml
var amountWater = 9999 //現在の水量 ml

if ( isButtonPressed && capacity > amountWater ) { // ボタンが押されて、タンクの容量が現在の水量より多い
    print("運転を開始します")
} else if ( isButtonPressed && capacity == amountWater ) { // ボタンが押されて、タンクの容量と現在の水量が一致（満水）している
    print("タンクが満水なので運転できません")
} else if ( isButtonPressed || capacity == amountWater) { // ボタンは押されてないけど、タンクの容量と現在の水量が一致（満水）している
    print("タンクが満水です")
} else { // ボタンが押されてない
    print("（なにもしない）")
}
