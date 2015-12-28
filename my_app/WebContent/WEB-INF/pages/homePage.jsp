<%@ include file="/common/taglibs.jsp" %>
 <%@ page contentType="text/html;charset=utf-8"%>

<head>
    <title id='Description'>This example demostrates how we can manipulate data at client side. The Grid plugin provides you callback functions when you add, remove or update a row.
    </title>
	<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxdata.js"></script> 
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxdatatable.js"></script> 
    <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxgrid.js"></script>
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxgrid.selection.js"></script> 
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxgrid.columnsresize.js"></script> 
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxgrid.filter.js"></script> 
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxgrid.sort.js"></script> 
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxgrid.pager.js"></script> 
<script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxgrid.grouping.js"></script>
     <script type="text/javascript" src="${ctx}/styles/jqwidgets/jqxtoolbar.js"></script>
    <script type="text/javascript" src="${ctx}/styles/scripts/demos.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var url = "http://localhost:8080/app1/jsonusers";
            // prepare the data
            var source =
            {
                dataType: "json",
                dataFields: [
                    { name: 'username', type: 'string' },
                    { name: 'email', type: 'string' },
                    { name: 'phoneNumber', type: 'string' },
                    { name: 'firstName', type: 'string' },
                    { name: 'lastName', type: 'string' }
                ],
                id: 'id',
                url: url,
                data: {
                    featureClass: "P",
                    style: "full",
                    maxRows: 50,
                    username: "jqwidgets"
                }
            };
            var dataAdapter = new $.jqx.dataAdapter(source);
            $("#dataTable").jqxDataTable(
            {
                width: '100%',
                pageable: true,
                pagerButtonsCount: 10,
                source: dataAdapter,
                columnsResize: true,
                columns: [
                  { text: 'username', dataField: 'username', width: 300 },
                  { text: 'email', dataField: 'email', width: 300 },
                  { text: 'phoneNumber', dataField: 'phoneNumber', width: 180 },
                  { text: 'firstName', dataField: 'firstName', width: 120 },
                  { text: 'lastName', dataField: 'lastName' }
              ]
            });
/*             $("#findButton").on('click', function () {
            	source.data.username='aaaa';
            	dataAdapter.dataBind();
                $("#events").find('span').remove();
                $("#events").append('<span>Submit Button Clicked</span');
            }); */
            
            $("#jqxToolBar").jqxToolBar({ width: "100%", height: 35, tools: " button button button",
                initTools: function (type, index, tool, menuToolIninitialization) {
                    switch (index) {
                        case 0:
                            tool.text(" Find ");
                            tool.on("click", function () {
                            	source.data.username='bbbb';
                            	dataAdapter.dataBind();
                            });
                            break;
                        case 1:
                            tool.text(" Add ");
                            tool.on("click", function () {
                            	source.data.username='bbbb';
                            	dataAdapter.dataBind();
                            });
                            break;
                        case 2:
                            tool.text(" Del ");
                            tool.on("click", function () {
                            	var selection = $("#dataTable").jqxDataTable('getSelection');
                            	alert(selection[0].username);
                            });
                            break;                            
                    }
                }
            });
           
            // perform data binding.
            
            
        });
    </script>
</head>
<body class='default'>

    
    <div id="jqxToolBar">
    </div>
     <div id="dataTable"></div>
     <div id='events'>
    </div>
    </div>
</body>