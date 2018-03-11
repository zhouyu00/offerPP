function setBox(type) {
    let seeker_type_box = document.querySelector('form .fl.user_type_box');
    let hr_type_box = document.querySelector('form .fr.user_type_box');
    let hr_input = document.querySelector('form .hr-input');
    let hr_radio = hr_type_box.querySelector('input[type=radio]');
    let seeker_input = document.querySelector('form .seeker-input');
    let seeker_radio = seeker_type_box.querySelector('input[type=radio]');

    if (type === 'seeker') {
        seeker_radio.checked = 'checked';
        hr_input.style.display = 'none';
        seeker_input.style.display = 'block';
    } else if (type === 'hr') {
        hr_input.style.display = 'block';
        seeker_input.style.display = 'none';
        hr_radio.checked = 'checked';
    }
}


document.addEventListener('DOMContentLoaded', (e) => {
    console.log('DOMLoad!');
user_type = '${user_type}';
console.log(user_type);

if (user_type === '') setBox('seeker');
else if (user_type === 'seeker' || user_type === 'hr') {
    setBox('${user_type}');
}
});

let type_choose_div = document.querySelector('.type_choose');
type_choose_div.addEventListener('click', (e) => {
    let tar = e.target;
if (tar.tagName === 'LABEL')
    tar = tar.parentNode.parentNode;

console.log(tar);

if (tar.className === 'fl user_type_box') {
    setBox('seeker');
} else if (tar.className === 'fr user_type_box') {
    setBox('hr');
}
});


// 嵌套元素  点按事件  点按在margin上是不算两个都点到的
// 该用类的时候还是要用