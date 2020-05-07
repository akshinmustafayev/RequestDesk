function SetDataToItem(class_name, data_info_value, data)
{
	var item = document.getElementsByClassName(class_name);
	for (var i = 0; i < item.length; i++) 
	{
		if (item[i].getAttribute('data-info') == data_info_value)
		{
			item[i].innerHTML = data;
		}
	}
}

function GetDataFromItem(class_name, data_info_value)
{
	var item_html;
	var item = document.getElementsByClassName(class_name);
	for (var i = 0; i < item.length; i++) 
	{
		if (item[i].getAttribute('data-info') == data_info_value)
		{
			item_html = item[i];
		}
	}
	return item_html;
}