<% Dim startTime
startTime = timer() %>
<!-- #include file="includes/settings.inc.asp" -->
<!-- #include file="includes/functions.inc.asp" -->
<html>
<head>
<title>
<%= strOfficeName %> Retriever
</title>
<link rel="shortcut icon" href="favicon.ico" />
<link href="assets/css/search.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="assets/js/search.js"></script>
</head>
<body scroll="no">
<table width="100%" border="0" cellpadding="0" cellspacing="0" height="100%">
<tr>
	<td width="149" class="navbar" valign="top">
    	<br>
		<form action="<%= Request.ServerVariables("SCRIPT_NAME") %>" method="get">
		<p> 
		  <input name="q" type="text" size="18" value="<%= Request.QueryString("q") %>" />
		  <br> 
		  <input type="submit" value="Search" />
		  <input type="button" value="Clear" onClick="window.location.href='default.asp';" />
		  <hr>
		 <span class="style2">Results per page:<br>
			<select name="numberofresults" id="numberofresults">
			  <option value="10"<% If Request("numberofresults") = "10" OR Request.QueryString = "" Then Response.Write(" selected") %>>10</option>
			  <option value="25"<% If Request("numberofresults") = "25" Then Response.Write(" selected") %>>25</option>
			  <option value="50"<% If Request("numberofresults") = "50" Then Response.Write(" selected") %>>50</option>
			  <option value="100"<% If Request("numberofresults") = "100" Then Response.Write(" selected") %>>100</option>
			  <option value="250"<% If Request("numberofresults") = "250" Then Response.Write(" selected") %>>250</option>
			  <option value="500"<% If Request("numberofresults") = "500" Then Response.Write(" selected") %>>500</option>
			  <option value="1000"<% If Request("numberofresults") = "1000" Then Response.Write(" selected") %>>1000</option>
			</select>
			<br>
		  Order by:<br>
		  <select name="orderby" id="orderby">
			  <option value="rank"<% If Request("orderby") = "write" OR Request.QueryString = "" Then Response.Write(" selected") %>>Rank</option>
			  <option value="create"<% If Request("orderby") = "create" Then Response.Write(" selected") %>>Creation</option>
			  <option value="write"<% If Request("orderby") = "write" Then Response.Write(" selected") %>>Last Write</option>
		  </select>
		  <br>
		  <select name="order" id="order">
			  <option value="a"<% If Request("order") = "a" Then Response.Write(" selected") %>>Ascending</option>
			  <option value="d"<% If Request("order") = "d" OR Request.QueryString = "" Then Response.Write(" selected") %>>Descending</option>
		  </select>
		  <br>
		  Client Code or Folder: 
		  <input name="clientcode" type="text" id="clientcode" size="7" value="<%= Request("clientcode") %>">
		  <br>
		File Types:<br>
		<div class="filetypes">
		<input type="checkbox" name="filetypes" value="doc, docx, txt, dot, docm, dotm" onClick="check2(this.form.filetypesall, this.checked)"<% If InStr(Request("filetypes"), "doc") > 0 Then Response.Write(" checked") %> id="filetype-doc"><label for="filetype-doc"><img src="assets/images/app-icons/word-small.png">&nbsp;Word</label><br>
		<input type="checkbox" name="filetypes" value="eml, rtf, msg" onClick="check2(this.form.filetypesall, this.checked)"<% If InStr(Request("filetypes"), "eml") > 0 Then Response.Write(" checked") %> id="filetype-eml"><label for="filetype-eml"><img src="assets/images/app-icons/outlook-small.png">&nbsp;Email</label><br>
		<input type="checkbox" name="filetypes" value="xls, xlt, xlsx, xlsm, xlxt, xltm, xlsb, xlam" onClick="check2(this.form.filetypesall, this.checked)"<% If InStr(Request("filetypes"), "xls") > 0 Then Response.Write(" checked") %> id="filetype-xls"><label for="filetype-xls"><img src="assets/images/app-icons/excel-small.png">&nbsp;Excel</label><br>
		<input type="checkbox" name="filetypes" value="pdf" onClick="check2(this.form.filetypesall, this.checked)"<% If InStr(Request("filetypes"), "pdf") > 0 Then Response.Write(" checked") %> id="filetype-pdf"><label for="filetype-pdf"><img src="assets/images/app-icons/acrobat-small.png">&nbsp;Acrobat</label><br>
		<input type="checkbox" name="filetypes" value="ppt, pptx, pptm, potx, potm, ppam, ppsx, ppsm" onClick="check2(this.form.filetypesall, this.checked)"<% If InStr(Request("filetypes"), "ppt") > 0 Then Response.Write(" checked") %> id="filetype-ppt"><label for="filetype-ppt"><img src="assets/images/app-icons/powerpoint-small.png">&nbsp;Powerpoint</label><br>
		<input type="checkbox" name="filetypes" value="jpg, jpeg, gif, png, bmp, tif, tiff" onClick="check2(this.form.filetypesall, this.checked)"<% If InStr(Request("filetypes"), "jpg") > 0 Then Response.Write(" checked") %> id="filetype-img"><label for="filetype-img"><img src="assets/images/app-icons/image-small.png">&nbsp;Image</label><br>
		<input type="checkbox" name="filetypesall" value="all" onClick="check(this.form.filetypes, this.checked)"<% If Request("filetypesall") = "all" OR Request.QueryString = "" Then Response.Write(" checked") %> id="filetype-all"><label for="filetype-all">ALL</label>
		</div>
		</span></p>
		</form>
	  <hr>

		<a href="OpenOfficeDocsInOffice.reg" title="Click here and select open/run if your documents are opening in your browser not in Office">Opening in Browser?</a>
		<p align="center"><a href="tips.asp" target="_blank">Tips</a> | <a href="querylanguage.asp" target="_blank">Query Language</a></p>
	</td>
	<td class="searchresults"><div class="scroll">
		<%
		Dim sSearchString
		Dim oQuery
		if request.querystring("q") = "" then
		%>
		<h1><%= strOfficeName %> Retriever</h1>
		<table width="800">
			<tr>
				<td><img src="assets/images/arrow.gif"></td>
				<td class="helpcell">Enter your search on the left and the results will appear in this window. If you want advice or tips on using the search there are detailed documents also linked on the left.</td>
			</tr>
			<tr><td colspan="2"><img src="assets/images/spacer.gif" height="20" width="1"></td>
			</tr>
			<tr>
				<td><img src="assets/images/arrow.gif"></td>
				<td class="helpcell">This box will allow you to have larger pages of results, allowing you to browse through quicker. However you will have to scroll more and each page will take longer to return </td>
			</tr>
			<tr><td colspan="2"><img src="sassets/images/pacer.gif" height="5" width="1"></td></tr>
			<tr>
				<td><img src="assets/images/arrow.gif"></td>
				<td class="helpcell">First select the field you wish to sort by, then the direction of that sort. Ranking is calculated based on the search you entered and is worked out based on document content (if available) or the abstract. </td>
			</tr>
			<tr><td colspan="2"><img src="assets/images/spacer.gif" height="15" width="1"></td></tr>
			<tr>
				<td><img src="assets/images/arrow.gif"></td>
				<td class="helpcell">Select here to remove client or internal from your search. Removing both leaves other folders (e.g. admin)</td>
			</tr>
			<tr><td colspan="2"><img src="assets/images/spacer.gif" height="7" width="1"></td></tr>
			<tr>
				<td><img src="assets/images/arrow.gif"></td>
				<td class="helpcell">Here you can enter any part of the folder name to restrict your search further such as client code.  You can also enter multiple levels of folder, for example "d031\2006\doc" would search the Dixcart Technical 2006 document folder.</td>
			</tr>
			<tr><td colspan="2"><img src="assets/images/spacer.gif" height="11" width="1"></td></tr>
			<tr>
				<td><img src="assets/images/arrow.gif"></td>
				<td class="helpcell">Select the document types you wish to see from their file extension. You can only select &quot;all&quot; OR any number of document types.</td>
			</tr>
			<tr><td colspan="2"><img src="assets/images/spacer.gif" height="150" width="1"></td></tr>
			<tr>
				<td><img src="assets/images/arrow.gif"></td>
				<td class="helpcell">Download this file ONLY if you are using a standalone machine (not Citrix) and your documents open in your Internet Explorer window, not in the relevant program. </td>
			</tr>
			<tr>
				<td colspan="2"><img src="assets/images/spacer.gif" height="80" width="1"></td>
			</tr>
<%
Dim strBrowserType
strBrowserType = Request.ServerVariables("HTTP_USER_AGENT")

If InStr(strBrowserType, "MSIE 7.0") Then
%>
			<tr>
				<td colspan="2" align="center">
					<input type="button" onClick="window.external.AddSearchProvider('/search/assets/files/<%= strOfficeName %>.xml')" value="Add As Search Provider">
				</td>
			</tr>
<%
End If
%>
		</table>
		<%
		else %>
		<h1>Results</h1>
<%
		  sSearchString = Request.QueryString("q")
		
		
		  Set oQuery = Server.CreateObject("IXSSO.Query")
		
		  strQuery = "@all " & sSearchString
		'  strQuery = sSearchString
		
		  If Request.QueryString("clientcode") <> "" Then
			strQuery = strQuery & " AND #path *" & Request.QueryString("clientcode") & "*"
		  End If
		
		  If Request.QueryString("filetypesall") <> "all" Then
			arrFileTypes = Split(Request.QueryString("filetypes"), ", ")
			For k = 0 to UBound(arrFileTypes)
				If k = 0 Then
					strQuery = strQuery & " AND (@FileName *." & arrFileTypes(k)
				Else
					strQuery = strQuery & " OR @FileName *." & arrFileTypes(k)
				End If
			Next
			strQuery = strQuery & ")"
		  End If
		
		  oQuery.Catalog = SEARCH_CATALOG
		  oQuery.Query = strQuery
		  oQuery.MaxRecords = 1000
		  oQuery.SortBy = Request.QueryString("orderby") & "[" & Request.QueryString("order") & "]"
		  oQuery.Columns = "DocAuthor, vpath, doctitle, FileName, Path, Write, Size, Rank, Create, Characterization, DocCategory, DocAppName"
		
		  Set oRS = oQuery.CreateRecordSet("nonsequential")
		
		  sSearchString = Replace( sSearchString, """", "")
		  sSearchString = Replace( sSearchString, ",", "")
		  sSearchString = Replace( sSearchString, ".", "")
		  sSearchString = Replace( sSearchString, "*", "")
		  sSearchString = Replace( sSearchString, "%", "")
		  sSearchString = Replace( sSearchString, "AND", "")
		  sSearchString = Replace( sSearchString, "OR", "")
		  sSearchString = Replace( sSearchString, "NOT", "")
		  sSearchString = Replace( sSearchString, "NEAR", "")
		
		  oRs.Pagesize = CInt(Request.QueryString("numberofresults"))
		  nPageCount = oRS.PageCount
		  nPage = CInt(Request.QueryString("page"))
		  If nPage < 1 Or nPage > nPageCount Then
			nPage = 1
		  End If
		
		  If oRS.EOF Then
			Response.Write "<p>No pages were found for the query <em>" & sSearchString & "</em></p>"
		  Else
			Response.Write "<table width=""100%"" cellspacing=""0""><tr><td class=""searchterms"" width=""50%"">Searching for <em>" & sSearchString & "</em></td>"
			If oRS.RecordCount = 1000 Then
				Response.Write "<td class=""resultsline"">Found more than 1000 results</td></tr></table>"
			Else
				Response.Write "<td class=""resultsline"">Found " & oRS.RecordCount & " results</td></tr></table>"
			End If
			oRS.AbsolutePage = nPage
		
			Do While Not (oRS.EOF Or oRS.AbsolutePage <> nPage)
		
			filepath = replace(oRS("path"), "\", "/")
			filepath = server.htmlencode(replace(filepath, strDriveLetter, strServerName))
		
			filepath = "file://" & filepath
			
			icon = fcnGetIcon(filepath)
		
			abstract = oRS("characterization")
		
			 %>
			<a href="<%=filepath%>"><img src="assets/images/<%=icon%>" width="16" height="16" alt="<%=icon%>" border="0" /></a> <a href="<%=filepath%>" target="_blank" class="filename"><%=fcnHighlightSearchTerms(oRS("doctitle"), sSearchString)%></a> (<a href="<%=filepath%>" target="_blank"><%=oRS("FileName")%></a>)<br />
			<span class="summary">Created: <%=oRS("Create")%> | last Write: <%=oRS("Write") %></span><br/ >
			<strong>Abstract:</strong> <%=fcnHighlightSearchTerms(abstract, sSearchString)%><br>
			<span class="location"><%= Replace(filepath, "file:", "") %> - <%=oRS("Size")%> bytes<br><br></span>
			<%
			oRS.MoveNext
			Loop
		  End If
		Set oRS = nothing
		Set oQuery = nothing %>
		<table align="center">
		<tr><% Call PageViewHooouse(nPageCount, nPage) %></tr>
		<tr class="hooouse"><% Call PageView(nPageCount, nPage) %></tr>
		</table>
		<p class="searchtimer">Your search string: <%= strQuery %><br>This search was generated in <%=Round((timer - StartTime)*1000) %> ms</p> <%
		end if
		%>
	</div></td>
	</tr>
	<tr>
	<td class="footer"></td>
		<td class="footer">Retriever Ver <%= strVer %> - &copy; <%= Datepart("YYYY", Now()) %> Dixcart Technical Solutions.</td>
	</tr>
</table>

</body>
</html>