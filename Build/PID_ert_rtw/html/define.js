function CodeDefine() { 
this.def = new Array();
this.def["ert_main.cpp:PID_Obj"] = {file: "ert_main_cpp.html",line:20,type:"var"};
this.def["rt_OneStep"] = {file: "ert_main_cpp.html",line:34,type:"fcn"};
this.def["main"] = {file: "ert_main_cpp.html",line:71,type:"fcn"};
this.def["PID_rtZControl_Output"] = {file: "PID_cpp.html",line:18,type:"var"};
this.def["Model_Param"] = {file: "PID_cpp.html",line:25,type:"var"};
this.def["step"] = {file: "PID_cpp.html",line:61,type:"fcn"};
this.def["initialize"] = {file: "PID_cpp.html",line:305,type:"fcn"};
this.def["terminate"] = {file: "PID_cpp.html",line:333,type:"fcn"};
this.def["getRTM"] = {file: "PID_cpp.html",line:351,type:"fcn"};
this.def["DW_PID_T"] = {file: "PID_h.html",line:41,type:"type"};
this.def["ConstB_PID_T"] = {file: "PID_h.html",line:46,type:"type"};
this.def["ExtU_PID_T"] = {file: "PID_h.html",line:53,type:"type"};
this.def["ExtY_PID_T"] = {file: "PID_h.html",line:58,type:"type"};
this.def["PID_U"] = {file: "PID_h.html",line:100,type:"var"};
this.def["Reference"] = {file: "PID_types_h.html",line:28,type:"type"};
this.def["States"] = {file: "PID_types_h.html",line:42,type:"type"};
this.def["Command"] = {file: "PID_types_h.html",line:53,type:"type"};
this.def["Model_Param_T"] = {file: "PID_types_h.html",line:77,type:"type"};
this.def["Control_Output"] = {file: "PID_types_h.html",line:88,type:"type"};
this.def["RT_MODEL_PID_T"] = {file: "PID_types_h.html",line:93,type:"type"};
this.def["PID_ConstB"] = {file: "PID_data_cpp.html",line:19,type:"var"};
this.def["int8_T"] = {file: "rtwtypes_h.html",line:47,type:"type"};
this.def["uint8_T"] = {file: "rtwtypes_h.html",line:48,type:"type"};
this.def["int16_T"] = {file: "rtwtypes_h.html",line:49,type:"type"};
this.def["uint16_T"] = {file: "rtwtypes_h.html",line:50,type:"type"};
this.def["int32_T"] = {file: "rtwtypes_h.html",line:51,type:"type"};
this.def["uint32_T"] = {file: "rtwtypes_h.html",line:52,type:"type"};
this.def["real32_T"] = {file: "rtwtypes_h.html",line:53,type:"type"};
this.def["real64_T"] = {file: "rtwtypes_h.html",line:54,type:"type"};
this.def["real_T"] = {file: "rtwtypes_h.html",line:60,type:"type"};
this.def["time_T"] = {file: "rtwtypes_h.html",line:61,type:"type"};
this.def["boolean_T"] = {file: "rtwtypes_h.html",line:62,type:"type"};
this.def["int_T"] = {file: "rtwtypes_h.html",line:63,type:"type"};
this.def["uint_T"] = {file: "rtwtypes_h.html",line:64,type:"type"};
this.def["ulong_T"] = {file: "rtwtypes_h.html",line:65,type:"type"};
this.def["char_T"] = {file: "rtwtypes_h.html",line:66,type:"type"};
this.def["uchar_T"] = {file: "rtwtypes_h.html",line:67,type:"type"};
this.def["byte_T"] = {file: "rtwtypes_h.html",line:68,type:"type"};
this.def["pointer_T"] = {file: "rtwtypes_h.html",line:86,type:"type"};
}
CodeDefine.instance = new CodeDefine();
var testHarnessInfo = {OwnerFileName: "", HarnessOwner: "", HarnessName: "", IsTestHarness: "0"};
var relPathToBuildDir = "../ert_main.c";
var fileSep = "\\";
var isPC = true;
function Html2SrcLink() {
	this.html2SrcPath = new Array;
	this.html2Root = new Array;
	this.html2SrcPath["ert_main_cpp.html"] = "../ert_main.cpp";
	this.html2Root["ert_main_cpp.html"] = "ert_main_cpp.html";
	this.html2SrcPath["PID_cpp.html"] = "../PID.cpp";
	this.html2Root["PID_cpp.html"] = "PID_cpp.html";
	this.html2SrcPath["PID_h.html"] = "../PID.h";
	this.html2Root["PID_h.html"] = "PID_h.html";
	this.html2SrcPath["PID_private_h.html"] = "../PID_private.h";
	this.html2Root["PID_private_h.html"] = "PID_private_h.html";
	this.html2SrcPath["PID_types_h.html"] = "../PID_types.h";
	this.html2Root["PID_types_h.html"] = "PID_types_h.html";
	this.html2SrcPath["PID_data_cpp.html"] = "../PID_data.cpp";
	this.html2Root["PID_data_cpp.html"] = "PID_data_cpp.html";
	this.html2SrcPath["rtwtypes_h.html"] = "../rtwtypes.h";
	this.html2Root["rtwtypes_h.html"] = "rtwtypes_h.html";
	this.getLink2Src = function (htmlFileName) {
		 if (this.html2SrcPath[htmlFileName])
			 return this.html2SrcPath[htmlFileName];
		 else
			 return null;
	}
	this.getLinkFromRoot = function (htmlFileName) {
		 if (this.html2Root[htmlFileName])
			 return this.html2Root[htmlFileName];
		 else
			 return null;
	}
}
Html2SrcLink.instance = new Html2SrcLink();
var fileList = [
"ert_main_cpp.html","PID_cpp.html","PID_h.html","PID_private_h.html","PID_types_h.html","PID_data_cpp.html","rtwtypes_h.html"];
