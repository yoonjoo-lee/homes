/**
 * 
 */
function dayAndNight() {
	  
	if(document.querySelector('#dnN').value === 'night') {
	    document.querySelector('body').style.backgroundColor = "#1e1f21";
	    document.querySelector('header').style.backgroundColor = "#292a2d";
	    document.querySelector('section').style.backgroundColor = "#1e1f21";
	    document.querySelector('#left-section').style.backgroundColor = "#1e1f21";
	    document.querySelector('#right-section').style.backgroundColor = "#1e1f21";
	    document.querySelector('#login-area').style.backgroundColor = "#292a2d";
	    document.querySelector('#board-inner-list').style.color = "#fff";
	    document.querySelector('#board-inner-list').style.border = "1px solid #fff";
	    document.querySelector('body').style.color = "#fff";
	    document.querySelector('#dnN').value = 'day';
  	} else {
	    document.querySelector('body').style.backgroundColor = "white";
	    document.querySelector('header').style.backgroundColor = "#fff";
	    document.querySelector('section').style.backgroundColor = "#fff";
	    document.querySelector('#left-section').style.backgroundColor = "#fff";
	    document.querySelector('#right-section').style.backgroundColor = "#fff";
	    document.querySelector('#login-area').style.backgroundColor = "#fff";
	    document.querySelector('#board-inner-list').style.color = "black";
	    document.querySelector('#board-inner-list').style.border = "1px solid black";
	    document.querySelector('#dnN').value = 'night';
	  }
}
/*function dayAndNight() {
  
  let target = document.getElementById('left-section');
  
  if(this.value === 'night') {
    target.style.backgroundColor = "black";
    this.value = 'day';
  } else {
    target.style.backgroundColor = "white";
    this.value = 'night'
  }
}*/