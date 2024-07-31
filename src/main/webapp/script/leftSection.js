"use strict";
const searchSection = document.querySelector('.leftSection .searchSection');
const itemSection = document.querySelector('.leftSection .itemSection');
const memberSection = document.querySelector('.leftSection .memberSection');
const innerContent = document.querySelector('.leftSection .innerContent');
const boardTitle = document.querySelector('.leftSection .boardTitle');

const createBoard = (board) => {
	if(board === 'searchSection'){
		
	}else{
		rect(300, innerContent);
		const leftSectionBtns = document.querySelectorAll(`.${board} section:not(:first-child)`);
		const boardClose = document.querySelector('.leftSection .boardCO');
		leftSectionBtns.forEach((btns)=>{
			btns.addEventListener('click', (btn)=>{
				boardTitle.textContent = btn.currentTarget.textContent;
				innerContent.style.display = 'flex';
			});
		});
		boardClose.addEventListener('click', (btn)=>{
			innerContent.style.display = 'none';
		});
	}
}

if(searchSection){
	createBoard('searchSection');
}
if(itemSection){
	createBoard('itemSection');
}
if(memberSection){
	createBoard('memberSection');
}