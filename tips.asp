<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Tips for Searching</title>
<link href="search.css" rel="stylesheet" type="text/css">
</head>

<body>
<p><img src="Is2Logo.Gif" width="500" height="44"></p>
<table>
<TR>
<TD class=GTHeading1Cell width=592 colSpan=2>
<P class=GTHeading1><strong>Tips for Searching</strong></P></TD>
</TR>
<TR>
<TD width=10 rowSpan=2></TD>
<TD width=592>
<P><BR>At its simplest, a query can be just a word or a phrase. But with the 
tips on this page, you can expand the focus of your query to give you more 
complete results. These tips will get you started with basic query language and 
acquaint you with the full power of Microsoft Index Server.</P>
<UL>
<LI>
<P align=left>Look for words with the same prefix. For example, in your query 
form type key* to find key, keying, keyhole, keyboard, and so on. </P>
<LI>
<P align=left>Search for all forms of a word. For example, in the form type 
sink** to find sink, sinking, sank, and sunk. </P>
<LI>
<P align=left>Search with the keyword NEAR, rather than AND, for words close to 
each other. For example, both of these queries, system and manager and system 
near manager, look for the words system and manager on the same page. But with 
NEAR, the returned pages are ranked in order of proximity: The closer together 
the words are, the higher the rank of that page. </P>
<LI>
<P align=left>Refine your queries with the AND NOT keywords to exclude certain 
text from your search. For example, if you want to find all instances of surfing 
but not surfing the Net, write the following query: </P>
<P align=left><STRONG>surfing AND NOT the Net </STRONG></P>
<LI>Add the OR keyword to find all instances of either one word or another, for 
example:
<P><STRONG>Abbott OR Costello </STRONG></P>
<P>This query finds all pages that mention Abbott or Costello or both. </P>
<LI>
<P align=left>Put quotation marks around keywords if you want Index Server to 
take them literally. For instance, if you type the following 
query:<BR><BR><STRONG>"system near manager"</STRONG><BR><BR>Index Server will 
literally look for the complete phrase system near manager. But if you type the 
same query without the quotation marks:<BR><BR><STRONG>system near 
manager</STRONG><BR><BR>Index Server searches all documents for the words system 
and manager. </P></LI></UL>
<P align=left>These hints will get you started, but&nbsp;for more complex 
queries and more examples, see the <A href="querylanguage.asp">query language</A> 
page.</P></TD></TR>

</table>
</body>
</html>
