//henry's first java script for sunshine library's KC labeling

//entryNum is the number of entries on the entire page
var entryNum=0;

function addEntry(){
	
  var container=$('<div></div>');
  container.append($('<div>'+'Problem '+(entryNum+1)+'</div>'));
  var form =$('<form><ul></ul></form>');
  subform=form.children().eq(0);
  //subform is the ul that comprises the entire form
  
  
  subform.append($('<li><label>Problem ID:</label><input type="text" class="problemId"></li>'))
  var catList=$('#catList').children('ul');

  for (var i = 0; i < catList.length; i++) {
    var category=catList.eq(i).children();
    console.log(category.length)
    var temp=$('<li></li>');

    for (var j = 0; j < category.length; j++) {
    if(j==0){
      var label=$('<label for="'+category.eq(j).text()+'">'+category.eq(j).text()+'</label>');
      var select=$('<select name="'+category.eq(j).text()+'"></select>');
      console.log(category.eq(j).text());
      }
      else{
      var option=$('<option value="'+category.eq(j).text()+'">'+category.eq(j).text()+'</option>');
      select.append(option);
      console.log(category.eq(j).text());

      }
    };
    temp.append(label);
    temp.append(select);
    subform.append(temp);
  }

  form.attr('id','entry'+entryNum)
  container.append(form);
  
  $('#table').append(container);
  entryNum++;
  $("#entryCount").val(entryNum);

}

function addMultEntry(){
  var num;
  num=Number( document.getElementById("entryCount").value );
  for (var i = 0; i < num; i++) {
    addEntry();
  };

}

function deleteResults(){
  document.getElementById('table').innerHTML="";
  entryNum=0;
  document.getElementById("entryCount").value=entryNum;

}

//this is for editing the categories (the contents inside the BLUE BOX)

function addCategory(){

  var entry=$('#entry');
  entry.append($('<div>Hello!</div>'));

}

function addCatBar(){

  var category=$('#category');

  category.append($('<div class="select"><input type="text"></div>'));
  

  $('#categoryCount').val( category.children().size()-7);

}

function deleteCatBar(){
  var delList=$('#category .select');
  delList.remove();
  $('#categoryCount').val( $('#category').children().size()-7); 

}

function createCat(){
  var catList=$('#catList');
  var name=$('#categoryName');
  var options=$('#category .select input');
  var fill=$('<ul></ul>');
  fill.html('<li>'+name.val()+'</li>');
  for (var i = 0; i < options.length; i++) {
    fill.append($('<li>'+options.eq(i).val()+'</li>'));
  };
  catList.append(fill);

}