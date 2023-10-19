function click_power() {
    var on_off=document.querySelector(".shop_option_power");
    console.log(on_off.innerText);
    if(on_off.innerText=="OFF"){
        on_off.style.background = "#9867b2"
        on_off.style.color = "#f2ebf5"
        on_off.innerText="ON"
        document.querySelector("#option1").disabled=false;
        document.querySelector("#option2").disabled=false;
        document.querySelector("#option3").disabled=false;
    }else {
        on_off.innerText="OFF"
        document.querySelector("#option1").disabled=true;
        document.querySelector("#option2").disabled=true;
        document.querySelector("#option3").disabled=true;
    }

}