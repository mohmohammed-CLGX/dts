﻿



function MyFunc() {
    //$get('ImageButton1')
    var ddlcounty = document.getElementById("ctl00_ContentPlaceHolder1_TabContainer1_editMastertab_hidmaster");
    var ddlstate = document.getElementById("ctl00_ContentPlaceHolder1_TabContainer1_editMastertab_lblmastermsg");
    if (confirm('There are Records Associated with this Master Record Do you want to Edit? ')) {

        ddlcounty.value = "1";
        ddlstate.value = "1";
        //                document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_editMastertab_').value = "1"
        //                document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_editMastertab_').value = "1"


        return false;
    }
    else {
        //cancel button clicked.
        //We will return true so that we can write server side in code behind
        alert("hello world");
        ddlcounty.value = "0";
        ddlstate.value = "0";
        //                document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_editMastertab_hidmaster').value = "0"
        //                document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_editMastertab_lblmastermsg').value = "0"
        return true;
    }
}
function HideModalPopupmpenewdel() {
    var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_mpeconfirmnewdelete');
    modal.hide();
    
}

                 function HideModalPopup() {
                     var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_ModalPopupExtender1');
                     // var modal1 = $find('PanelRecentissue');
                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtdownfile').style.display = "none";
                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_btnrecentdown').style.display = "none";
                    
                          
                     modal.hide();
                     // modal1.style.visibility = "visible";
                 }
                 function ShowMyModalPopup(IssueID) {
                     //var modal = $find('ContentPlaceHolder1_TabContainer1_RecentIssuestab_ModalPopupExtender1');
                     //var modal = document.getElementById("<%=ModalPopupExtender1.ClientID%>");
                     var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_ModalPopupExtender1');

                     modal.show();
                     WebService.FetchOneCustomer(IssueID, DisplayResult);
                 }
                 function HideModalPopupsch() {
                     var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_ModalPopupExtendersch');
                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtdownfilesch').style.display = "none";
                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_btnschdown').style.display = "none";
                                    
                     // var modal1 = $find('PanelRecentissue');
                     modal.hide();
                     // modal1.style.visibility = "visible";
                 }
                 function ShowMyModalPopupsch(IssueID) {
                     //var modal = $find('ContentPlaceHolder1_TabContainer1_RecentIssuestab_ModalPopupExtender1');
                     //var modal = document.getElementById("<%=ModalPopupExtender1.ClientID%>");
                     var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_ModalPopupExtendersch');

                     modal.show();
                     WebService.FetchOneCustomer(IssueID, DisplayResultsch);
                 }

                 function ShowMyModalPopupnew(IssueID) {
                     //var modal = $find('ContentPlaceHolder1_TabContainer1_RecentIssuestab_ModalPopupExtender1');
                     //var modal = document.getElementById("<%=ModalPopupExtender1.ClientID%>");
                     //  var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ModalPopupExtendernew');
                     
                    // modal.show();
                     WebService.FetchOneCustomer(IssueID, DisplayResultnew);
                 }
                 function HideModalPopupnew() {
                     var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ModalPopupExtendernew');
                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtdownfilenew').style.display = "none";
                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_btnnewdown').style.display = "none";

                     // var modal1 = $find('PanelRecentissue');
                     modal.hide();
                     // modal1.style.visibility = "visible";
                 }
//                 function DisplayResultnew(result) {
//                     var doc;
//                     if (window.ActiveXObject) {
//                         doc = new ActiveXObject("Microsoft.XMLDOM");
//                         doc.preserveWhiteSpace = "true";
//                         doc.async = "false";
//                         doc.loadXML(result);
//                     }
//                     else {
//                         var parser = new DOMParser();
//                          doc = parser.parseFromString(result, "text/xml");
//                     }

//                     var root = doc.documentElement.childNodes;
//                     var tags;

//                     for (var i = 0; i < root.length; i++) {
//                         if (root[i].nodeType == 1) {
//                             tags = root[i].childNodes;
//                         }
//                     }

//                     for (var i = 0; i < tags.length; i++) {
//                         if (tags[i].nodeType == 1) {
//                             var xmlvalue;
//                             try {
//                                 xmlvalue = tags[i].childNodes[0].nodeValue;
//                             }
//                             catch (Error) {
//                                 xmlvalue = "";
//                             }

//                             switch (tags[i].nodeName) {
//                                 case "IDIssue":
//                                     var label = document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_lblnewID');
//                                     label.innerHTML = xmlvalue;
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_hidnew').value = xmlvalue;
//                                     break;
//                                 case "FIPSCounty":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupfipsnew').value = xmlvalue;
//                                     break;
//                                 case "State":
//                                     if (xmlvalue != "00")
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupstatenew').value = xmlvalue;
//                                     else
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupstatenew').value = "Nationwide"

//                                     break;
//                                 case "County":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupcountynew').value = xmlvalue;
//                                     break;


//                                 case "Edition":
//                                     if (xmlvalue != "0")
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupEditionnew').value = xmlvalue;
//                                     else
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupEditionnew').value = "N/A";

//                                     break;
//                                 case "Version":
//                                     if (xmlvalue != "0")
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupVersionnew').value = xmlvalue;
//                                     else
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupVersionnew').value = "N/A";

//                                     break;
//                                 case "ICP":
//                                     if (xmlvalue != "0")
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupicpnew').value = xmlvalue;
//                                     else
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupicpnew').value = "N/A";

//                                     break;
//                                 case "County":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupcountynew').value = xmlvalue;
//                                     break;
//                                 case "Relatedlink":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpuprlinksnew').value = xmlvalue;
//                                     break;

//                                 case "IssueDetails":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupissuenew').value = xmlvalue;
//                                     break;
//                                 case "Resolution":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupresolutionnew').value = xmlvalue;
//                                     break;
//                                     txtpuptitle
//                                 case "Title":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpuptitlenew').value = xmlvalue;
//                                     break;
//                                 case "Submitter":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupSubmitternew').value = xmlvalue;
//                                     break;
//                                 case "IDProcessingType":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlpupptypenew').value = xmlvalue;
//                                     break;
//                                 case "IDFileType":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlpupftypenew').value = xmlvalue;
//                                     break;
//                                 case "IDIssueType":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlpupitypenew').value = xmlvalue;
//                                     break;
//                                 case "Isuplodedfile":
//                                     if (xmlvalue == "true") {
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtdownfilenew').style.display = "";
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_btnnewdown').style.display = "";

//                                     }
//                                     break;

//                                 case "IDuploadedfile":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_hidnewid').value = xmlvalue;

//                                     break;
//                                 case "FileName":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtdownfilenew').value = xmlvalue;
//                                     break;


//                             }
//                         }
//                     }
                 //                 }

                 function DisplayResultnew(result) {
                     var doc;
                     if (window.ActiveXObject) {
                         doc = new ActiveXObject("Microsoft.XMLDOM");
                         doc.preserveWhiteSpace = "true";
                         doc.async = "false";
                         doc.loadXML(result);
                     }
                     else {
                         var parser = new DOMParser();
                         doc = parser.parseFromString(result, "text/xml");
                     }

                     var root = doc.documentElement.childNodes;
                     var tags;

                     for (var i = 0; i < root.length; i++) {
                         if (root[i].nodeType == 1) {
                             tags = root[i].childNodes;
                         }
                     }

                     for (var i = 0; i < tags.length; i++) {
                         if (tags[i].nodeType == 1) {
                             var xmlvalue;
                             try {
                                 xmlvalue = tags[i].childNodes[0].nodeValue;
                             }
                             catch (Error) {
                                 xmlvalue = "";
                             }

                             switch (tags[i].nodeName) {
                                 case "IDIssue":
//                                     var label = document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_lblnewID');
//                                     label.innerHTML = xmlvalue;
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_hidnew').value = xmlvalue;
                                     break;
                                 case "FIPSCounty":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlfpisnew').value = xmlvalue;
                                     if (xmlvalue != "00")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlstate_countynew').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlstate_countynew').value = "Nationwide"

                                     break;
//                                 case "County":
//                                     
//                                     break;
//                                 case "County":
//                                    // document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtpupcountynew').value = xmlvalue;
//                                     break;


                                 case "Edition":
                                     if (xmlvalue != "0")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtEditionnew').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtEditionnew').value = "N/A";

                                     break;
                                 case "Version":
                                     if (xmlvalue != "0")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtVersionnew').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtVersionnew').value = "N/A";

                                     break;
                                 case "ICP":
                                     if (xmlvalue != "0")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtICPnew').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtICPnew').value = "N/A";

                                     break;
                                
                                 case "Relatedlink":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtRelatedLinksnew').value = xmlvalue;
                                     break;

                                 case "IssueDetails":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtIssueDetailsnew').value = xmlvalue;
                                     break;
                                 case "Resolution":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtResolutionnew').value = xmlvalue;
                                     break;
                                     txtpuptitle
                                 case "Title":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtTitlenew').value = xmlvalue;
                                     break;
                                 case "Submitter":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlnewSubmitter').value = xmlvalue;
                                     break;
                                 case "IDProcessingType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlProcessingtypenew').value = xmlvalue;
                                     break;
                                 case "IDFileType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlFileTypenew').value = xmlvalue;
                                     break;
                                 case "IDIssueType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_ddlIssueTypenew').value = xmlvalue;
                                     break;
//                                 case "Isuplodedfile":
//                                     if (xmlvalue == "true") {
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtdownfilenew').style.display = "";
//                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_btnnewdown').style.display = "";

//                                     }
//                                     break;

//                                 case "IDuploadedfile":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_hidnewid').value = xmlvalue;

//                                     break;
//                                 case "FileName":
//                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_txtdownfilenew').value = xmlvalue;
//                                     break;


                             }
                         }
                     }
                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_btnNew').value = "Update";
                    // document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_NewIssuetab_PaneAddNew').value = "Update";  
                 }
                
                 function fnClickUpdate(sender, e) {
                     __doPostBack(sender, e);
                 }
                 function DisplayResultsch(result) {
                     var doc;
                     if (window.ActiveXObject) {
                         doc = new ActiveXObject("Microsoft.XMLDOM");
                         doc.preserveWhiteSpace = "true";
                         doc.async = "false";
                         doc.loadXML(result);
                     }
                     else {
                         var parser = new DOMParser();
                         var doc = parser.parseFromString(result, "text/xml");
                     }

                     var root = doc.documentElement.childNodes;
                     var tags;

                     for (var i = 0; i < root.length; i++) {
                         if (root[i].nodeType == 1) {
                             tags = root[i].childNodes;
                         }
                     }

                     for (var i = 0; i < tags.length; i++) {
                         if (tags[i].nodeType == 1) {
                             var xmlvalue ;
                             try {
                                 xmlvalue = tags[i].childNodes[0].nodeValue;
                             }
                             catch (Error) {
                                 xmlvalue = "";
                             }

                             switch (tags[i].nodeName) {
                                 case "IDIssue":
                                     var label = document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_lblschID');
                                     label.innerHTML = xmlvalue;
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_hidsch').value = xmlvalue;
                                     break;
                                 case "FIPSCounty":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupfipssch').value = xmlvalue;
                                     break;
                                 case "State":
                                     if (xmlvalue != "00")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupstatesch').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupstatesch').value = "Nationwide"

                                     break;
                                 case "County":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupcountysch').value = xmlvalue;
                                     break;


                                 case "Edition":
                                     if (xmlvalue != "0")
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupEditionsch').value = xmlvalue;
                                 else
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupEditionsch').value = "N/A";
                             
                                     break;
                                 case "Version":
                                     if (xmlvalue != "0")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupVersionsch').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupVersionsch').value = "N/A";
                                 
                                     break;
                                 case "ICP":
                                     if (xmlvalue != "0")
                                        document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupicpsch').value = xmlvalue;
                                    else
                                        document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupicpsch').value = "N/A";
                                   
                                     break;
                                 case "County":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupcountysch').value = xmlvalue;
                                     break;
                                 case "Relatedlink":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpuprlinkssch').value = xmlvalue;
                                     break;

                                 case "IssueDetails":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupissuesch').value = xmlvalue;
                                     break;
                                 case "Resolution":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupresolutionsch').value = xmlvalue;
                                     break;
                                     txtpuptitle
                                 case "Title":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpuptitlesch').value = xmlvalue;
                                     break;
                                 case "Submitter":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupSubmittersch').value = xmlvalue;
                                     break;
                                 case "IDProcessingType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_ddlpupptypesch').value = xmlvalue;
                                     break;
                                 case "IDFileType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_ddlpupftypesch').value = xmlvalue;
                                     break;
                                 case "IDIssueType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_ddlpupitypesch').value = xmlvalue;
                                     break;
                                     case "Isuplodedfile":
                                     if(xmlvalue=="true") {
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtdownfilesch').style.display = "";
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_btnschdown').style.display = "";
                     
                                     }
                                     break;

                                 case "IDuploadedfile":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_hidschid').value = xmlvalue;

                                     break;
                                 case "FileName":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtdownfilesch').value = xmlvalue;
                                     break;
                                    
                                     
                             }
                         }
                     }
                 }

                 function DisplayResult(result) {
                     var doc;
                     if (window.ActiveXObject) {
                         doc = new ActiveXObject("Microsoft.XMLDOM");
                         doc.preserveWhiteSpace = "true";
                         doc.async = "false";
                         doc.loadXML(result);
                     }
                     else {
                         var parser = new DOMParser();
                         var doc = parser.parseFromString(result, "text/xml");
                     }

                     var root = doc.documentElement.childNodes;
                     var tags;

                     for (var i = 0; i < root.length; i++) {
                         if (root[i].nodeType == 1) {
                             tags = root[i].childNodes;
                         }
                     }

                     for (var i = 0; i < tags.length; i++) {
                         if (tags[i].nodeType == 1) {
                             var xmlvalue;
                             try{
                              xmlvalue= tags[i].childNodes[0].nodeValue;
                             }
                             catch (err)
                             {
                             xmlvalue="";
                             }

                             switch (tags[i].nodeName) {
                                 case "IDIssue":
                                     var label = document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_lblID');
                                     label.innerHTML = xmlvalue;
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_hidCusCode').value = xmlvalue;
                                     break;
                                 case "FIPSCounty":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupfips').value = xmlvalue;
                                     break;
                                 case "State":
                                     if (xmlvalue != "00")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupstate').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupstate').value = "Nationwide"

                                     break;
                                 case "County":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupcounty').value = xmlvalue;
                                     break;


                                 case "Edition":
                                    if(xmlvalue!="0")
                                        document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupEdition').value = xmlvalue;
                                    else
                                        document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupEdition').value = "N/A";
                                   
                                     break;
                                 case "Version":
                                     if (xmlvalue != "0")
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupVersion').value = xmlvalue;
                                     else
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupVersion').value = "N/A";
                                 
                                     break;
                                 case "ICP":
                                  if (xmlvalue != "0")
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupicp').value = xmlvalue;
                                 else
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupicp').value = "N/A";
                               
                                     break;
                                 case "County":
                                    
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupcounty').value = xmlvalue;
                                     
                                         
                                 
                                     break;
                                 case "Relatedlink":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpuprlinks').value = xmlvalue;
                                     break;

                                 case "IssueDetails":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupissue').value = xmlvalue;
                                     break;
                                 case "Resolution":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupresolution').value = xmlvalue;
                                     break;
                                     txtpuptitle
                                 case "Title":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpuptitle').value = xmlvalue;
                                     break;
                                 case "Submitter":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupSubmitter').value = xmlvalue;
                                     break;
                                 case "IDProcessingType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_ddlpupptype').value = xmlvalue;
                                     break;
                                 case "IDFileType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_ddlpupftype').value = xmlvalue;
                                     break;
                                 case "IDIssueType":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_ddlpupitype').value = xmlvalue;
                                     break;
                                 case "Isuplodedfile":
                                     if (xmlvalue == "true") {
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtdownfile').style.display = "";
                                         document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_btnrecentdown').style.display = "";  
                                    
                                     }
                                     break;

                                 case "IDuploadedfile":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_hiduploadfileid').value = xmlvalue;

                                     break;
                                 case "FileName":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtdownfile').value = xmlvalue;
                                     break;
                                     
                                    
                             }
                         }
                     }
                 }
    

    