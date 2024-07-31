const rect = (width, ele) =>{
	let size = 0;
	const bodyRect = document.body.getBoundingClientRect();
	size = bodyRect.width - width;
	ele.style.width = `${size}px`;
}

window.addEventListener('resize', ()=>{
	rect(300,innerContent);
});