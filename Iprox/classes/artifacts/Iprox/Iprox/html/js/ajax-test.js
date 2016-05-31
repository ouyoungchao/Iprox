
var ProSubid=2,
	ProNextPage=1,					//124�еõ�
	ProSumPage=1,					//124�еõ�
	PepNextPage=1,
	PepSumPage=1,
	SpeNextPage=1,
	SpeSumPage=1,
	SpeSubid=1;

var subCon={};
subCon.setPageTurnBtn={};

subCon.setPageTurnBtn.count=function(whichPageTurn){

	var oPageBox=document.getElementById(whichPageTurn),
	    oAllPage=oPageBox.getElementsByTagName('label'),
	    pageTurn1=oPageBox.getElementsByTagName("a")[1],
	    pageTurn2=oPageBox.getElementsByTagName("a")[2],
	    pageTurn3=oPageBox.getElementsByTagName("a")[3];
	
	if(oAllPage[0].innerHTML==1){
		pageTurn2.style.display="none";
		pageTurn3.style.display="none";
	}else if(oAllPage[0].innerHTML==2){
		
		pageTurn3.style.display="none";
	}

};

subCon.setPageTurnBtn.changePageBtn=function(sumPage,NextPage,whichPageTurn){
	var oPageBox=document.getElementById(whichPageTurn),
	    oAllPage=oPageBox.getElementsByTagName('label'),
	    pageTurn1=oPageBox.getElementsByTagName("a")[1],
	    pageTurn2=oPageBox.getElementsByTagName("a")[2],
	    pageTurn3=oPageBox.getElementsByTagName("a")[3];

	if(sumPage>=3){
	    if(NextPage==2){
	    	pageTurn3.style.color="white";
	    	pageTurn2.style.color="white";
	    	pageTurn1.style.color="black";
	    	pageTurn3.innerHTML=3;
            pageTurn2.innerHTML=2;
            pageTurn1.innerHTML=1;
	    }else if(NextPage==3){
	    	pageTurn1.style.color="white";
	    	pageTurn3.style.color="white";
	    	pageTurn2.style.color="black";
	    	pageTurn3.innerHTML=3;
            pageTurn2.innerHTML=2;
            pageTurn1.innerHTML=1;
	    }else{
	    	pageTurn1.style.color="white";
			pageTurn2.style.color="white";
			pageTurn3.style.color="black";
	    	pageTurn3.innerHTML=NextPage-1;
	    	pageTurn2.innerHTML=NextPage-2;
	    	pageTurn1.innerHTML=NextPage-3;
	    }

	}else{
		if(NextPage==2){
			pageTurn1.style.color="black";
	    }
	
	}
};



function ajaxSelf(type,url,data,fn){
	$.ajax({
			type:'GET',
			url:url,
			data:(function (){
					if(typeof data.subId!='undefined'){
						return 'subId'+'='+data.subId+'&'+'NextPageNum='+data.NextPageNum;
					}else if(typeof data.proteinId!='undefined' ){
						return 'proteinId='+data.proteinId+'&'+'NextPageNum='+data.NextPageNum;
					}else{
						return 'peptide='+data.peptide+'&'+'NextPageNum='+data.NextPageNum;
					}
				})(),
			success:function(response,status,xhr){
				var box = JSON.parse(xhr.responseText);
				fn(box);
			},			  	  	
		});
}

$(function(){
	$('.tabswitch')[0].setAttribute('AId','a');			
	$($($('[AId] a')[1])).click(function(){  //针对Protein的点击而进行函数调用
		ajaxSelf('get','/Iprox/protein/selectAll',{NextPageNum:1,subId:ProSubid},trFn);			//Ĭ��Ϊ��һҳ
		
	});
	
	$($($('[AId] a')[2])).click(function(){  //针对peptide的点击而进行函数调用
		ajaxSelf('get','/Iprox/peptide/selectAll',{NextPageNum:1,subId:ProSubid},pepTab);

	});
	
	$($($('[AId] a')[3])).click(function(){  //针对spectrum的点击而进行函数调用
		ajaxSelf('get','/Iprox/spectrum/selectAll',{NextPageNum:1,subId:ProSubid},speTab);

	});
	
});


//针对Protein的点击而执行ajax回调函数
function trFn(box){
	ProSumPage=box['SumPage'];
	ProNextPage=box['NextPageNum'];					//selectAllProtein Table
	$('.PageTurn')[6].innerHTML=ProSumPage;

	subCon.setPageTurnBtn.count("protein-page-turn");//去掉多余的分页按钮

	// judgeSumPage('PageTurn');
	var rows=box['AllProtein'].length;
	var str=' ';
	var s=null;
	for(var i=0;i<rows;i++){			
		s=box['AllProtein'][i]['protein'];
						str += "<tr sub_id="+box['AllProtein'][i]['subProject'].subid+"  protein_id="+s.protein_id+"><td>" + s.protein_id + 
						       "</td><td>"+s.name+"</td><td>" + s.psms + "</td><td>" + s.distinct_peptides + "</td><td>" + s.ptms + "</td><td>"+' '+
						       "</td><td>" + s.threshold + "</td><td>" +s.coverage+ "</td><td>" + s.pi + "</td><td>"+s.protein_id+"</td></tr>";
		}

	$($(".itbody")[0]).html(str);
    $("#itable1").prev("h2").text($("#itable .itbody td").eq(0).text());
	subCon.setPageTurnBtn.changePageBtn(ProSumPage,ProNextPage,"protein-page-turn");//根据分页的点击来改变按钮样式



	if(ProNextPage==2){	//因为由于上面ProNextPage已经改变，所以要等于2，如果不加这句就会重复执行
		ajaxSelf('get','/Iprox/peptide/selectPeptideByProteinId',{NextPageNum:1,proteinId:box['AllProtein'][0]['protein'].protein_id},footTab);
	}
	clickColor('itbody',0,0);	
	var trNodes=$($('.itbody')[0]).children('tr');
	for(var j=0;j<rows;j++){
		$(trNodes[j]).click(function(){
		protein_id=$(this).attr('protein_id');			//�����������Ǹ�table��tr��protein_id	
		sub_id=$(this).attr('sub_id');
		$("#itable1").prev("h2").text(this.getElementsByTagName('td')[0].innerHTML);
		ajaxSelf('get','/Iprox/peptide/selectPeptideByProteinId',{NextPageNum:1,proteinId:protein_id},footTab);
		});
	}	
}
var protein_id=0;
var sub_id=0;


// 加载protein表下面的表
function footTab(box){					//selectPeptideByProtein ID table
	var rows=box['peptideByProteinId'].length;
	var str=' ';
	for(var j=0;j<rows;j++){
		$($(".itbody")[1]).html(str);
		var s=null;
		var m=null;
		var n=null;
		s=box['peptideByProteinId'][j]['peptide'];
		m=box['peptideByProteinId'][j]['protein'];
		n=box['peptideByProteinId'][j]['spectrum'];
		str += "<tr peptide_id="+s.peptide_id+"><td>" + s.peptide + "</td><td>" + s.delta_m_z + "</td><td>" + s.identification_id + "</td><td>" + s.length + "</td><td>" + s.lons + "</td><td>" +s.mascot_score + "</td><td>" + s.modifications + "</td><td>" + s.charge + "</td><td>" + s.fit + "</td><td>" + s.pi + "</td><td>" + s.precursor_m_z + "</td><td>" + s.psm + "</td><td>" + s.start + "</td><td>" + s.stop + "</td><td>" + m.protein_id+ "</td><td>" + n.spectrum_id + "</td></tr>";
	}
	$($(".itbody")[1]).html(str);
	// 给protein下Protein[CYC_ALLM]表格的tr添加点击事件
	 $("#itable1 tr").on("click",function(){
    	var $this=$(this),
            proteinSpectrumUrl="/Iprox/spectrum/selectSpectrumViewByPepId?peptide_id="+$this.attr("peptide_id");
	    zxj.tools.ajax(proteinSpectrumUrl,zxj.tools.loadProteinSpectrum);
    });

	clickColor('itbody',1,0);			
}


//�ñ����ɫ���
function changeColor(tabClass,num){
	var tbody=$("."+tabClass+"")[num];
	//alert(tbody);
	for(var i=tbody.rows.length-1;i>-1;i--){
		if(i%2){
			tbody.rows[i].style.backgroundColor="#aaebca";
		}else{
			tbody.rows[i].style.backgroundColor="#a1d6f0";
		}
	}
}


//������ʹ��ɫ����
function clickColor(tabClass,num,defaultNum){
	changeColor(tabClass,num);
	var tbody=$("."+tabClass+"")[num];
	for(var i=0;i<tbody.rows.length;i++){
			$($(tbody).children('tr')[i]).click(function(){				//�����ʱ���onclick�¼�������	����onclick�Ḳ��
				changeColor(tabClass,num);
				this.style.backgroundColor="#fe9362";		
			});
	}
	if(defaultNum==0){
			if($(tbody).children('tr')[0])
				$(tbody).children('tr')[0].style.backgroundColor="#fe9362";
	}
	
}

//����Ϊ��ҳ��

//var turnPage=1;
$(function(){
	turnAjax('PageTurn','/Iprox/protein/selectAll',{subId:ProSubid},trFn,1);	
	turnAjax('PepPageTurn','/Iprox/peptide/selectAll',{subId:ProSubid},pepTab,2);
	turnAjax('SpePageTurn','/Iprox/spectrum/selectAll',{subId:ProSubid},speTab,3);
})


function turnAjax(className,url,obj,fn,num){	

	$($('.'+className+'')[6]).html(50);				//*********************����*******************
	var page=1;
	var pageTurn1=$($('.'+className+'')[1]);
	var pageTurn2=$($('.'+className+'')[2]);
	var pageTurn3=$($('.'+className+'')[3]);
	
	$($('.'+className+'')[0]).click(function(){			//��ҳ��ajax

		ajaxSelf('get',url,{NextPageNum:1,subId:obj.subId},fn);						
	});
	
	$($('.'+className+'')[1]).click(function(){			
		ajaxSelf('get',url,{NextPageNum:$($('.'+className+'')[1]).html(),subId:obj.subId},fn);						
	});
	
	$($('.'+className+'')[2]).click(function(){			
		ajaxSelf('get',url,{NextPageNum:$($('.'+className+'')[2]).html(),subId:obj.subId},fn);						
	});
	
	$($('.'+className+'')[3]).click(function(){					
		ajaxSelf('get',url,{NextPageNum:$($('.'+className+'')[3]).html(),subId:obj.subId},fn);						
	});
	
	clickNext(num,obj);
	
	$($('.'+className+'')[8]).click(function(){			//��ҳ
		
		var page=parseInt($('.'+className+'')[7].value),
		    sumPage;
		if((/^\d$/).test(page)){
			switch(className){
				case "PageTurn":sumPage=ProSumPage;break;
				case "PepPageTurn":sumPage=PepSumPage;break;
				case "SpePageTurn":sumPage=SpeSumPage;break;
			}
			if(page<=sumPage && page>=1){
				ajaxSelf('get',url,{NextPageNum:page,subId:obj.subId},fn);
			}
		}
	});
	


	function clickNext(num,obj){
	if(num==1){
		$($('.'+className+'')[4]).click(function(){			//��һҳ
			var sumpage=0;
			sumpage=parseInt($($('.'+className+'')[6]).html());

			// if(parseInt(pageTurn1.html())>0&&parseInt(pageTurn2.html())>1&&parseInt(pageTurn3.html())>2 && sumpage>=3 && ($('.'+className+'')[3].className).indexOf('down')==-1){
			
			if(ProNextPage<=sumpage){
				ajaxSelf('get',url,{NextPageNum:ProNextPage,subId:obj.subId},fn);	
			}
		});
		
		$($('.'+className+'')[5]).click(function(){			//βҳ��ajax
		//alert('s');
			ajaxSelf('get',url,{NextPageNum:ProSumPage,subId:obj.subId},fn);						
		});
	}else if(num==2){														//������Ķεĵ����һҳ
		$($('.'+className+'')[4]).click(function(){			//��һҳ
			var sumpage=0;
			
			sumpage=parseInt($($('.'+className+'')[6]).html());
			// alert(sumpage);
			//if(parseInt(pageTurn1.html())>0&&parseInt(pageTurn2.html())>1&&parseInt(pageTurn3.html())>2 && sumpage>=3 && ($('.'+className+'')[3].className).indexOf('down')==-1){	
			if(PepNextPage<=sumpage){	
				ajaxSelf('get',url,{NextPageNum:PepNextPage,subId:obj.subId},fn);	
			}
		});
		
		$($('.'+className+'')[5]).click(function(){			//βҳ��ajax
			ajaxSelf('get',url,{NextPageNum:PepSumPage,subId:obj.subId},fn);						
		});
		
	}else if(num ==3){
		$($('.'+className+'')[4]).click(function(){			//��һҳ
			var sumpage=0;
			sumpage=parseInt($($('.'+className+'')[6]).html());
			//if(parseInt(pageTurn1.html())>0&&parseInt(pageTurn2.html())>1&&parseInt(pageTurn3.html())>2 && sumpage>=3 && ($('.'+className+'')[3].className).indexOf('down')==-1){	
			//alert(obj.subId);
			if(SpeNextPage<=sumpage){
				ajaxSelf('get',url,{NextPageNum:SpeNextPage,subId:obj.subId},fn);
					
			}
		});
		
		$($('.'+className+'')[5]).click(function(){			//βҳ��ajax
			ajaxSelf('get',url,{NextPageNum:SpeSumPage,subId:obj.subId},fn);						
		});
	}
}
	
}
















	var pep=0;
	function pepTab(box){   //peptide点击执行的ajax里的回调函数

			PepSumPage=box['pageNum'];
			PepNextPage=box['NextPageNum'];					//selectAllPeptide
			$('.PepPageTurn')[6].innerHTML=PepSumPage;


			subCon.setPageTurnBtn.count("peptide-page-turn");//去掉多余的分页按钮


			// judgeSumPage('PepPageTurn');
			var rows=box['peptides'].length;
					
			var str=' ';
			//alert( box['AllProtein']);
			var s=null;
			var m=null;
			var n=null;
			for(var i=0;i<rows;i++){
						
				s=box['peptides'][i]['peptide'];
				m=box['peptides'][i]['protein'];
				str += "<tr peptide="+s.peptide+"><td>" + s.peptide + "</td><td>" + m.protein + "</td><td>" + s.delta_m_z + "</td><td>" + 
				       s.charge + "</td><td>"+s.precursor_m_z+"</td><td>" + s.modifications + "</td><td>" + s.lons + "</td><td>" + s.mascot_score + 
				       "</td><td>" + s.length + "</td><td>" + s.start + "</td><td>" + s.stop + "</td><td>" + s.pi + "</td><td>" +s.spectrum_id + 
				       "</td><td>" + m.protein_id + "</td><td>" + s.peptide_id + "</td></tr>";
			}

			$($(".itbody")[3]).html(str);
			subCon.setPageTurnBtn.changePageBtn(PepSumPage,PepNextPage,"peptide-page-turn");//根据分页的点击来改变按钮样式
            

			if(PepNextPage==2){
			ajaxSelf('get','/Iprox/peptide/selectPeptideByPeptide',{NextPageNum:1,peptide:box['peptides'][0]['peptide'].peptide},pepFootTab);
			}
			clickColor('itbody',3,0);
			var trNodes=$($('.itbody')[3]).children('tr');
			//alert(trNodes[2]);
			for(var j=0;j<rows;j++){
				$(trNodes[j]).click(function(){
					pep=$(this).attr('peptide');			//�����������Ǹ�table��tr��protein_id
					ajaxSelf('get','/Iprox/peptide/selectPeptideByPeptide',{NextPageNum:1,peptide:pep},pepFootTab);
				});
			}
		}



function pepFootTab(box){					//selectPeptideByPeptide Table
	var rows=box['PeptideDetail'].length;
	var str=' ';
	for(var j=0;j<rows;j++){
		$($(".itbody")[4]).html(str);
		var s=null;
		var m=null;
		var n=null;
		s=box['PeptideDetail'][j]['peptide'];
		m=box['PeptideDetail'][j]['protein'];
		n=box['PeptideDetail'][j]['spectrum'];
		str += "<tr peptide_id="+s.peptide_id+" peptide="+s.peptide+"><td>" + s.peptide + "</td><td>" + m.protein + "</td><td>" + 
		       s.delta_m_z + "</td><td>" + s.charge + "</td><td>" + s.precursor_m_z + "</td><td>" + s.modifications + "</td><td>" + 
		       s.lons + "</td><td>" + s.mascot_score + "</td><td>" + s.length + "</td><td>" + 
		       s.start + "</td><td>" + s.stop + "</td><td>" + n.spectrum_id + "</td><td>" + s.peptide_id+ "</td></tr>";
	
	}
	$($(".itbody")[4]).html(str);
	
	clickColor('itbody',4,0);
	// 给Peptide选项卡下面的psm下的表格tr添加点击事件
    $("#itable6 tr").on("click",function(){
    	var $this=$(this),
            proteinSpectrumUrl="/Iprox/spectrum/selectSpectrumViewByPepId?peptide_id="+$this.attr("peptide_id");
	    zxj.tools.ajax(proteinSpectrumUrl,zxj.tools.loadPeptideSpectrum);
    });
}




// 针对spectrum点击的ajax的回调函数
function speTab(box){
    
	SpeSumPage=box['SumPage'];
	SpeNextPage=box['NextPageNum'];					//spectrum Table
	$('.SpePageTurn')[6].innerHTML=SpeSumPage;

	subCon.setPageTurnBtn.count("spectrum-page-turn");//去掉多余的分页按钮


	// judgeSumPage('SpePageTurn');
	var rows=box['speList'].length;			
	var str=' ';
	var s=null;
	for(var i=0;i<rows;i++){				
		s=box['speList'][i]['spectrum'];
		str += "<tr spectrum_id="+s.spectrum_id+"><td>" + s.spectrum_id + "</td><td>" + s.ms_level + "</td><td>" + s.identified + "</td><td>" + s.charge + 
		       "</td><td>" + s.precursor_m_z + "</td><td>" + s.precursor_Intensity + "</td><td>" + s.sum_of_intensity + "</td><td>" + s.peaks + "</td></tr>";
				
	}

	$($(".itbody")[6]).html(str);
	// 给Spectrum选项卡下面的表格tr添加点击事件
    $("#itable4 tr").on("click",function(){
    	var $this=$(this),
            proteinSpectrumUrl="/Iprox/spectrum/selectSpectrumViewBySpectrumId?spectrumId="+$this.attr("spectrum_id");
	    zxj.tools.ajax(proteinSpectrumUrl,zxj.tools.loadSpectrumSpectrum);
    });
	subCon.setPageTurnBtn.changePageBtn(SpeSumPage,SpeNextPage,"spectrum-page-turn");//根据分页的点击来改变按钮样式
	clickColor('itbody',6,0);
}



