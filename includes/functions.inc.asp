<%
strPageFileName = Request.ServerVariables("SCRIPT_NAME")

Sub PageView(TotalPages, CurPage)
	'If there's more than one page, we need paging.
	If TotalPages > 1 Then
		'First check to see if we're not on page 1. If not, show the "previous" arrow.
		If CurPage > 1 then
		'All links need to have the sort order, the current page, any variables you
		'need to pass, and ViewPerPage (unless you want to hard code this stuff.)
		  	Response.Write "<td align=""right""><a href=""" & strPageFileName & "?" & fcnRebuildQS() & "&page=" & curpage - 1 & """><b>&lt;</b></a><td>"
		Else
			'A little place marker for when there's no previous arrow.
			Response.Write "<td><font color=#ffffff><b>&lt;</b></font><td>"
		End If

		'Start with the page numbering, making a link for every page in TotalPages
		For i = 1 to TotalPages
			'Show only numbers that are 10 less than and 10 greater than the current page.
			If Int(i) > int(curpage - 10) AND int(i) < int(curpage + 10) Then
				If Int(curpage) <> i Then
					Response.Write "<td><a href=""" & strPageFileName & "?" & fcnRebuildQS() & "&page=" & i & """>"
					Response.Write i &"</a></td>"
				Else
				'This makes a non-hyperlinked number out of the current page.
					Response.Write "<td>" & i & "</td>"
				End If
			End If
		Next

		'After writing all of the numbers, show the "next" arrow (while applicable)
		If CInt(CurPage) <> CInt(TotalPages) then
			Response.Write "<td><a href=""" & strPageFileName & "?" & fcnRebuildQS() & "&page=" & curpage + 1 & """><b>&gt;</b></a></td>"
		Else
			'A little place marker for when there's no next arrow.
			Response.Write "<td><font color=#ffffff>&nbsp;<b>&gt;</b></font></td>"
		End If
	End If
End Sub

Sub PageViewHooouse(TotalPages, CurPage)
	'If there's more than one page, we need paging.
	If TotalPages > 1 Then
		'First check to see if we're not on page 1. If not, show the "previous" arrow.
		If CurPage > 1 then
		'All links need to have the sort order, the current page, any variables you
		'need to pass, and ViewPerPage (unless you want to hard code this stuff.)
		  	Response.Write "<td><a href=""" & strPageFileName & "?" & fcnRebuildQS() & "&page=" & curpage - 1 & """><b><img src=""assets/images/nav_previous.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/d.gif"" border=""0""><img src=""assets/images/i.gif"" border=""0""></b></a><td>"
		Else
			'A little place marker for when there's no previous arrow.
			Response.Write "<td><img src=""assets/images/d.gif"" border=""0""><img src=""assets/images/i.gif"" border=""0""><td>"
		End If

		'Start with the page numbering, making a link for every page in TotalPages
		For i = 1 to TotalPages
			'Show only numbers that are 10 less than and 10 greater than the current page.
			If Int(i) > int(curpage - 10) AND int(i) < int(curpage + 10) Then
				If Int(curpage) <> i Then
					Response.Write "<td><a href=""" & strPageFileName & "?" & fcnRebuildQS() & "&page=" & i & """>"
					Response.Write "<img src=""assets/images/x.gif"" border=""0""></a></td>"
				Else
				'This makes a non-hyperlinked number out of the current page.
					Response.Write "<td><img src=""assets/images/x.gif"" border=""0""></td>"
				End If
			End If
		Next

		'After writing all of the numbers, show the "next" arrow (while applicable)
		If CInt(CurPage) <> CInt(TotalPages) then
			Response.Write "<td><a href=""" & strPageFileName & "?" & fcnRebuildQS() & "&page=" & curpage + 1 & """><b><img src=""assets/images/c.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/a.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/r.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/t.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/nav_next.gif"" border=""0""></b></a></td>"
		Else
			'A little place marker for when there's no next arrow.
			Response.Write "<td><b><img src=""assets/images/c.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/a.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/r.gif"" border=""0""><img src=""assets/images/spacer.gif"" border=""0"" width=""5""><img src=""assets/images/t.gif"" border=""0""></b></td>"
		End If
	End If
End Sub

Function fcnHighlightSearchTerms(strItem, sSearchString)

	If strItem <> "" Then
		strItem = Replace(strItem, "<", "&lt;")
		strItem = Replace(strItem, ">", "&gt;")
	End If

	j = 0
	arrTerms = Split(sSearchString, " ")
	If not IsNull(strItem) Then
		For j = 0 to UBound(arrTerms)
			strItem = replace(strItem, arrTerms(j), "<span class=""search" & j & """>" & UCase(arrTerms(j)) & "</span>", 1, -1, 1) '1's are just to make textual, rather than binary comparisons
		Next
	End if

	fcnHighlightSearchTerms = strItem

End Function

Function fcnGetIcon(strFilePath)

	strExt = right(strFilePath, Len(strFilePath) - InStrRev(strFilePath, "."))

	Select Case strExt
		Case "doc", "rtf", "docx"
			strIcon = "word"
		Case "xls", "xlsx"
			strIcon = "excel"
		Case "pdf"
			strIcon = "acrobat"
		Case "xlt", "xlst"
			strIcon = "exceltemp"
		Case "dot", "dotx"
			strIcon = "wordtemp"
		Case "html", "htm"
			strIcon = "html"
		Case "vsd"
			strIcon = "visio"
		Case "zip"
			strIcon = "zip"
		Case "ppt"
			strIcon = "powerpoint"
		Case "txt"
			strIcon = "text"
		Case "msg"
			strIcon = "msg"
		Case Else
			strIcon = "unknown"
	End Select
	
	fcnGetIcon = strIcon & ".gif"

End Function

Function fcnRebuildQS()

	fcnRebuildQS = "q=" & Request.QueryString("q") & "&numberofresults=" & Request.QueryString("numberofresults") & "&orderby=" & Request.QueryString("orderby") & "&order=" & Request.QueryString("order") & "&client=" & Request.QueryString("client") & "&internal=" & Request.QueryString("internal") & "&clientcode=" & Request.QueryString("clientcode") & "&filetypes=" & Request.QueryString("filetypes") & "&filetypesall=" & Request.QueryString("filetypesall")

End Function


%>