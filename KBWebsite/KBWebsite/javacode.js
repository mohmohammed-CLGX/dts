

                


                 function HideModalPopup() {
                     var modal = $find('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_ModalPopupExtender1');
                     // var modal1 = $find('PanelRecentissue');
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
                             var xmlvalue = tags[i].childNodes[0].nodeValue;

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
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupEditionsch').value = xmlvalue;
                                     break;
                                 case "Version":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupVersionsch').value = xmlvalue;
                                     break;
                                 case "ICP":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_SearchIssuestab_txtpupicpsch').value = xmlvalue;
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
                             var xmlvalue = tags[i].childNodes[0].nodeValue;

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
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupEdition').value = xmlvalue;
                                     break;
                                 case "Version":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupVersion').value = xmlvalue;
                                     break;
                                 case "ICP":
                                     document.getElementById('ctl00_ContentPlaceHolder1_TabContainer1_RecentIssuestab_txtpupicp').value = xmlvalue;
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
                             }
                         }
                     }
                 }
    

    