<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form id="frm_motevt" method="post">
	<table cellpadding="5">
		<tr>
			<td>事件名称：</td>
			<td><input class="easyui-textbox" type="text" name="evtname" data-options="required:true"></input></td>
		</tr>
		<tr>
			<td>业务类型：</td>
			<td><input id='cbx_biztype' class="easyui-textbox" type="text" name="biztype" data-options="required:true"></input></td>
		</tr>
		<tr>
			<td>事件状态：</td>
			<td><input id='cbx_evtstats' class="easyui-textbox" type="text" name="evtstats" data-options="required:true"></input></td>
		</tr>
		<tr>
			<td>事件描述：</td>
			<td><input  class="easyui-textbox"  name="evtdesc" data-options="required:false,multiline:true" style="width:200px;height:100px"></input></td>
		</tr>
	</table>
</form>
<script>
var evtCombox = new BSS.Combox('#cbx_evtstats');
var bizCombox = new BSS.Combox('#cbx_biztype');
bizCombox.fromDict('DICT_BIZTYPE',function(){
	evtCombox.fromDict('DICT_EVTSTATS',function(){
			setOk()
	});
});
function setOk(){
	MOTEVTDIALOG.ok = function(){
		var evt = BSS.form2json('#frm_motevt');
		BSS.dispatch({code:22011,data:[evt]},function(resp){
			if(resp.code == 0){
				BSS.info('保存成功');
			}else{
				BSS.warning(resp.message);
			}
		},function(resp){
			console.log(JSON.stringify(resp));
		});
	}
}
</script>