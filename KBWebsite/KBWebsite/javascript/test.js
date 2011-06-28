function OpenSearchResults(str) {
    var url = document.getElementById(str);

    window.open("http://" + url.value, "mywindow", 'width=300,height=200,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes');

}

function OpenUrlLinks() {
    var url = document.getElementById("<%=txtRelatedLinksnew.ClientID%>").value;

    var urls = url.split(",");
    var regexp = /(http|https|HTTP|HTTPS):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/
    for (var i = 0; i < urls.length; i++) {

        if (regexp.test(urls[i])) {
            // alert(urls[i]);
            window.open(urls[i], "", 'width=900,height=600,menubar=yes,status=yes,location=yes,toolbar=yes,scrollbars=yes');

        }
    }


}

function newstateselchange() {
    var ddlnewstate = document.getElementById("<%=ddlstate_countynew.ClientID%>");
    var Value = ddlnewstate.options[ddlnewstate.selectedIndex].value;
    var ddlfips = document.getElementById("<%=ddlfpisnew.ClientID%>");
    ddlfips.value = Value;
}
function newFipsselchange() {
    var ddlFips = document.getElementById("<%=ddlfpisnew.ClientID%>");
    var Value = ddlFips.options[ddlFips.selectedIndex].value;
    var ddlnewstate = document.getElementById("<%=ddlstate_countynew.ClientID%>");
    ddlnewstate.value = Value;

}


function fipsselchange() {

    var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
    var Text = ddlFips.options[ddlFips.selectedIndex].text;
    var Value = ddlFips.options[ddlFips.selectedIndex].value;
    var ddlcounty = document.getElementById("<%=ddlcountysch1.ClientID%>");
    var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
    ddlcounty.value = Value;
    ddlstate.value = Value.split(" ")[0];

    // alert("fips :" + Value);
}
function countyselchange() {
    var ddlcounty = document.getElementById("<%=ddlcountysch1.ClientID%>");
    var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
    var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
    var Text = ddlcounty.options[ddlcounty.selectedIndex].text;
    var Value = ddlcounty.options[ddlcounty.selectedIndex].value;

    ddlFips.value = ddlcounty.options[ddlcounty.selectedIndex].value;
    ddlstate.value = ddlcounty.options[ddlcounty.selectedIndex].value.split(" ")[0];

    //alert("county :" + Value);

}
function fipsselchangeRecent() {

    var ddlFips = document.getElementById("<%=ddlRecentFips.ClientID%>");
    var Value = ddlFips.options[ddlFips.selectedIndex].value;
    var ddlcounty = document.getElementById("<%=ddlRecentCounty.ClientID%>");
    ddlcounty.value = Value;
    //  alert("fips :" + Value);
}
function countyselchangeRecent() {
    var ddlcounty = document.getElementById("<%=ddlRecentCounty.ClientID%>");
    var ddlFips = document.getElementById("<%=ddlRecentFips.ClientID%>");
    var Text = ddlcounty.options[ddlcounty.selectedIndex].text;
    var Value = ddlcounty.options[ddlcounty.selectedIndex].value;
    ddlFips.value = ddlcounty.options[ddlcounty.selectedIndex].value;
    // alert("county :" + Value);

}
function stateselchange() {
    var ddlcounty = document.getElementById("<%=ddlcountysch1.ClientID%>");
    var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
    //var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
    var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");
    var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
    var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
    if (ddlstate.options[ddlstate.selectedIndex].value == "1") {
        chkfips.disabled = true;
        chkcountysch1.disabled = true;
    }
    else {
        chkfips.disabled = false;
        chkcountysch1.disabled = false;

    }

}
function chkstate() {
    var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
    var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");

    var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
    var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");

    var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
    var ddlcountysch1 = document.getElementById("<%=ddlcountysch1.ClientID%>");



    if (chkstate.checked) { //ddlstate.style. = 'none';
        ddlstate.disabled = false;
        chkfips.disabled = true;
        chkcountysch1.disabled = true;
        ddlFips.disabled = false;
        ddlcountysch1.disabled = false;

    }
    else {
        // ddlstate.style.display = '';
        ddlstate.disabled = true;
        ddlstate.value = 0;

        chkfips.disabled = false;
        chkcountysch1.disabled = false;
        ddlFips.disabled = true;
        ddlcountysch1.disabled = true;
        ddlFips.value = 0;
        ddlcountysch1.value = 0;



    }
}

function chkfips() {
    var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
    var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
    var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");
    var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");
    var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
    var ddlcountysch1 = document.getElementById("<%=ddlcountysch1.ClientID%>");
    if (chkfips.checked) { //ddlstate.style. = 'none';
        ddlFips.value = 0;
        ddlstate.disabled = true;
        ddlstate.value = 0;
        ddlcountysch1.disabled = true;
        ddlcountysch1.value = 0;
        ddlFips.disabled = false;
        chkstate.disabled = true;
        chkstate.checked = false;
        chkcountysch1.disabled = true;
        chkcountysch1.checked = false;
    }
    else {


        ddlFips.disabled = true;
        ddlFips.value = 0;
        ddlcountysch1.value = 0;
        ddlstate.value = 0;
        chkstate.disabled = false;
        //chkstate.checked = false;
        chkcountysch1.disabled = false;
        //chkcountysch1.checked = false;
    }

}



function chkcounty() {
    var chkcountysch1 = document.getElementById("<%=chkcountysch1.ClientID%>");
    var ddlcountysch1 = document.getElementById("<%=ddlcountysch1.ClientID%>");
    var ddlstate = document.getElementById("<%=ddlstatesch.ClientID%>");
    var ddlFips = document.getElementById("<%=ddlFipssch.ClientID%>");
    var chkfips = document.getElementById("<%=chkFipssch.ClientID%>");
    var chkstate = document.getElementById("<%=chkstatesch.ClientID%>");


    if (chkcountysch1.checked) { //ddlstate.style. = 'none';
        ddlcountysch1.disabled = false;
        ddlFips.value = 0;
        ddlstate.disabled = true;
        ddlstate.value = 0;


        ddlFips.disabled = true;
        chkstate.disabled = true;
        chkstate.checked = false;
        chkfips.checked = false;
        chkfips.disabled = true;

    }
    else {
        // ddlstate.style.display = '';
        ddlcountysch1.disabled = true;
        ddlFips.value = 0;
        chkstate.disabled = false;
        ddlcountysch1.value = 0;
        ddlstate.value = 0;
        chkfips.disabled = false;

    }
}


function Togglecheck(checkid, Childid, isddl) {

    var chkcontrol = document.getElementById(checkid);
    var childcontrol = document.getElementById(Childid);

    if (chkcontrol.checked) {
        childcontrol.disabled = false;


    }
    else {
        childcontrol.disabled = true;
        if (isddl == "yes")
            childcontrol.value = 0;
        else
            childcontrol.value = ""

    }
}



function toggleGroup(img, numberOfRows) {
    //  get a reference to the row and table
    var tr = img.parentNode.parentNode;
    var table = $get('orders');
    var src = img.src;

    //  do some simple math to determine how many
    //  rows we need to hide/show
    var startIndex = tr.rowIndex + 1;
    var stopIndex = startIndex + parseInt(numberOfRows);

    //  if the img src ends with plus, then we are expanding the
    //  rows.  go ahead and remove the hidden class from the rows
    //  and update the image src
    if (src.endsWith('plus.png')) {
        for (var i = startIndex; i < stopIndex; i++) {
            Sys.UI.DomElement.removeCssClass(table.rows[i], 'hidden');
        }

        src = src.replace('plus.png', 'minus.png');
    }
    else {
        for (var i = startIndex; i < stopIndex; i++) {
            Sys.UI.DomElement.addCssClass(table.rows[i], 'hidden');
        }

        src = src.replace('minus.png', 'plus.png');
    }

    //  update the src with the new value
    img.src = src;
}
   
