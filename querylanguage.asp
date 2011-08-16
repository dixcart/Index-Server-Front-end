<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Query Language</title>
<link href="search.css" rel="stylesheet" type="text/css">
</head>
<body>
 <p><img src="Is2Logo.Gif" width="500" height="44"></p>
 <table>
 <TR>
<TD class=GTHeading1 Cell width=592 colSpan=2>
<P class=GTHeading1><strong>Query Language</strong></P></TD>
<TR>
<TD width=592 colSpan=2>
<P><BR><A name=QueryLanguage></A></P>
<UL>
<LI><A href="#Operators"><B>Boolean and Proximity Operators</B></A> 
<LI><A href="#Wildcards"><B>Wildcards</B></A> 
<LI><A href="#FreeTextQueries"><B>Free-Text Queries</B></A> 
<LI><A href="#VectorQueries"><B>Vector Space Queries</B></A> 
<LI><A href="#PropertyValueQueries"><B>Property Value Queries</B></A> 
<LI><A href="#Examples"><B>Query Examples</B></A> 
<LI><A href="#PropertyNamesList"><B>List of Property Names</B></A> </LI></UL>
<P>You can search for any word or phrase on a Web site by just typing the word 
or phrase into a query form and clicking the button to execute the query (for 
example, the "Execute Query" button on the sample query form). Searches produce 
a list of files that contain the word or phrase no matter where they appear in 
the text. </P>
<P>This list gives the rules for formulating queries: 
<UL>
<LI>
<P align=left>Multiple consecutive words are treated as a phrase; they must 
appear in the same order within a matching document.</P>
<LI>
<P align=left>Queries are case-insensitive, so you can type your query in 
uppercase or lowercase. </P>
<LI>
<P align=left>You can search for any word except for those in the exception list 
(for English, this includes a, an, and, as, and other common words), which are 
ignored during a search.</P>
<LI>
<P align=left>Words in the exception list are treated as placeholders in phrase 
and proximity queries. For example, if you searched for “Word for Windows”, the 
results could give you “Word for Windows” and “Word and Windows”, because for is 
a noise word and appears in the exception list.</P>
<LI>
<P align=left>Punctuation marks such as the period (.), colon (:), semicolon 
(;), and comma (,) are ignored during a search.</P>
<LI>
<P align=left>To use specially treated characters such as &amp;, |, ^, #, @, $, 
(, ), in a query, enclose your query in quotation marks (“).</P>
<LI>
<P align=left>To search for a word or phrase containing quotation marks, enclose 
the entire phrase in quotation marks and then double the quotation marks around 
the word or words you want to surround with quotes. For example, “World-Wide Web 
or ““Web””” searches for World-Wide Web or “Web”.</P>
<LI>
<P align=left>You can use <A href="#Operators">Boolean operators</A> (AND, OR, 
and NOT) and the <A href="#Operators">proximity operator</A> (NEAR) to specify 
additional search information.</P>
<LI>
<P align=left>The <A href="#Wildcards">wildcard character</A> (*) can match 
words with a given prefix. The query esc* matches the terms “ESC,” “escape,” and 
so on.</P>
<LI>
<P align=left><A href="#FreeTextQueries">Free-text queries</A> can be specified 
without regard to query syntax.</P>
<LI>
<P align=left><A href="#VectorQueries">Vector space queries</A> can be 
specified.</P>
<LI>
<P align=left>Activex™ (OLE) and file attribute <A 
href="#PropertyValueQueries">property value queries</A> can be 
issued.</P></LI></UL>
<H4><A name=Operators>Boolean and Proximity Operators</A></H4>
<P>Boolean and proximity operators can create a more precise query.</P>
<DIV align=left>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>To Search For</TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>Example</TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>Results</TH></TR>
<TR>
<TD vAlign=top width="33%">Both terms in the same page </TD>
<TD vAlign=top width="33%">access and basic <BR>—Or—<BR>access &amp; basic</TD>
<TD vAlign=top width="33%">Pages with both the words “access” and “basic” 
</TD></TR>
<TR>
<TD vAlign=top width="33%">Either term in a page </TD>
<TD vAlign=top width="33%">cgi or isapi<BR>—Or—<BR>cgi | isapi</TD>
<TD vAlign=top width="33%">Pages with the words “cgi” or “isapi” </TD></TR>
<TR>
<TD vAlign=top width="33%">The first term without the second term </TD>
<TD vAlign=top width="33%">access and not basic<BR>—Or—<BR>access &amp; ! 
basic</TD>
<TD vAlign=top width="33%">Pages with the word “access” but not “basic” 
</TD></TR>
<TR>
<TD vAlign=top width="33%">Pages not matching a property value </TD>
<TD vAlign=top width="33%">not @size = 100<BR>—Or—<BR>! @size = 100</TD>
<TD vAlign=top width="33%">Pages that are not 100 bytes </TD></TR>
<TR>
<TD vAlign=top width="33%">Both terms in the same page, close together </TD>
<TD vAlign=top width="33%">excel near project<BR>—Or—<BR>excel ~ project</TD>
<TD vAlign=top width="33%">Pages with the word “excel” near the word “project” 
</TD></TR></TBODY></TABLE></DIV>
<P>Hints: 
<UL>
<LI>
<P align=left>You can add parentheses to nest expressions within a query. The 
expressions in parentheses are evaluated before the rest of the query.</P>
<LI>
<P align=left>Use double quotes (“) to indicate that a Boolean or NEAR operator 
keyword should be ignored in your query. For example, “Abbott and Costello” will 
match pages with the phrase, not pages that match the Boolean expression. In 
addition to being an operator, the word and is a noise word in English.</P>
<LI>
<P align=left>The NEAR operator is similar to the AND operator in that NEAR 
returns a match if both words being searched for are in the same page. However, 
the NEAR operator differs from AND because the rank assigned by NEAR depends on 
the proximity of words. That is, the rank of a page with the searched-for words 
closer together is greater than or equal to the rank of a page where the words 
are farther apart. If the searched-for words are more than 50 words apart, they 
are not considered near enough, and the page is assigned a rank of zero.</P>
<LI>
<P align=left>The NOT operator can be used only after an AND operator in content 
queries; it can be used only to exclude pages that match a previous content 
restriction. For property value queries, the NOT operator can be used apart from 
the AND operator. </P>
<LI>The AND operator has a higher precedence than OR. For example, the first 
three queries are equal, but the fourth is not:
<P align=left>a AND b OR c<BR>c OR a AND b<BR>c OR (a AND b)<BR>(c OR a) AND 
b</P></LI></UL>
<P>Note:&nbsp;&nbsp;The symbols (&amp;, |, !, ~) and the English keywords AND, 
OR, NOT, and NEAR work the same way in all languages supported by Index Server. 
Localized keywords are also available when the browser locale is set to one of 
the following six languages:</P>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="40%" bgColor=#cccccc>Language</TH>
<TH vAlign=bottom align=left width="60%" bgColor=#cccccc>Keywords</TH></TR>
<TR>
<TD vAlign=top width="40%">German</TD>
<TD vAlign=top width="60%">UND, ODER, NICHT, NAH</TD></TR>
<TR>
<TD vAlign=top width="40%">French</TD>
<TD vAlign=top width="60%">ET, OU, SANS, PRES</TD></TR>
<TR>
<TD vAlign=top width="40%">Spanish</TD>
<TD vAlign=top width="60%">Y, O, NO, CERCA</TD></TR>
<TR>
<TD vAlign=top width="40%">Dutch</TD>
<TD vAlign=top width="60%">EN, OF, NIET, NABIJ</TD></TR>
<TR>
<TD vAlign=top width="40%">Swedish</TD>
<TD vAlign=top width="60%">OCH, ELLER, INTE, NÄRA</TD></TR>
<TR>
<TD>Italian</TD>
<TD>E, O, NO, VICINO</TD></TR></TBODY></TABLE>
<H4><A name=Wildcards>Wildcards</A></H4>
<P>Wildcard operators help you find pages containing words similar to a given 
word. </P>
<DIV align=left>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc><A name=Wildcards>To 
Search For</A></TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc><A 
name=Wildcards>Example </A></TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc><A 
name=Wildcards>Results</A></TH></TR>
<TR>
<TD vAlign=top width="33%"><A name=Wildcards>Words with the same prefix</A></TD>
<TD vAlign=top width="33%"><A name=Wildcards>comput* </A></TD>
<TD vAlign=top width="33%"><A name=Wildcards>Pages with words that have the 
prefix “comput,” such as “computer,” “computing,” and so on</A></TD></TR>
<TR>
<TD vAlign=top width="33%"><A name=Wildcards>Words based on the same stem 
word</A></TD>
<TD vAlign=top width="33%"><A name=Wildcards>fly** </A></TD>
<TD vAlign=top width="33%"><A name=Wildcards>Pages with words based on the same 
stem as “fly,” such as “flying,” “flown,” “flew,” and so on 
</A></TD></TR></TBODY></TABLE></DIV>
<H4><A name=FreeTextQueries>Free-Text Queries</A></H4>
<P>The query engine finds pages that best match the words and phrases in a 
free-text query. This is done by automatically finding pages that match the 
meaning, not the exact wording, of the query. Boolean, proximity, and wildcard 
operators are ignored within a free-text query. Free-text queries are prefixed 
with $contents.</P>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc><A 
name=FreeTextQueries>To Search For</A></TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc><A 
name=FreeTextQueries>Example </A></TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc><A 
name=FreeTextQueries>Results</A></TH></TR>
<TR>
<TD vAlign=top width="33%"><A name=FreeTextQueries>Files that match 
free-text</A></TD>
<TD vAlign=top width="33%"><A name=FreeTextQueries>$contents how do I print in 
Microsoft Excel? </A></TD>
<TD vAlign=top width="33%"><A name=FreeTextQueries>Pages that mention printing 
and Microsoft Excel.</A></TD></TR></TBODY></TABLE>
<H4><A name=VectorQueries>Vector Space Queries</A></H4>
<P>The query engine supports vector space queries. Vector queries return pages 
that match a list of words and phrases. The rank of each page indicates how well 
the page matched the query. </P>
<DIV align=left>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>To Search For</TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>Example</TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>Results</TH></TR>
<TR>
<TD vAlign=top width="33%">Pages that contain specific words</TD>
<TD vAlign=top width="33%">light, bulb</TD>
<TD vAlign=top width="33%">Files with words that best match the words being 
searched for</TD></TR>
<TR>
<TD vAlign=top width="33%">Pages that contain weighted prefixes, words, and 
phrases</TD>
<TD vAlign=top width="33%">invent*, light[50], bulb[10], "light bulb"[400]</TD>
<TD vAlign=top width="33%">Files that contain words prefixed by “invent,” the 
words “light,” “bulb,” and the phrase “light bulb” (the terms are 
weighted)</TD></TR></TBODY></TABLE></DIV>
<UL>
<LI>Components in vector queries are separated by commas. 
<LI>Components in vector queries can be weighted by using the [weight] syntax. 
<LI>Pages returned by vector queries do not necessarily match every term in the 
query. 
<LI>Vector queries work best when the results are sorted by rank. </LI></UL>
<H4><A name=PropertyValueQueries>Property Value Queries</A></H4>
<P>Property value queries can be used to find files that have property values 
that match a given criteria. The properties over which you can query include 
basic file information like file name and file size, and ActiveX properties 
including the document summary (abstract) that is stored in files created by 
ActiveX-aware applications. </P>
<P>There are two types of property queries: 
<UL>
<LI>
<P align=left>Relational property queries consist of an “at” character (@), a <A 
href="#PropertyNames">property name</A>, a <A 
href="#RelationalOperators">relational operator</A>, and a <A 
href="#PropertyValues">property value</A>. For example, to find all of the files 
larger than one million bytes, issue the query @size &gt; 1000000.</P>
<LI>
<P align=left>Regular expression property queries consist of a number sign (#), 
a <A href="#PropertyNames">property name</A>, and a <A 
href="#RegularExpressions">regular expression</A> for the <A 
href="#PropertyValues">property value</A>. For example, to find to find all of 
the video (.avi) files, issue the query #filename *.avi. Regular expressions 
will never match the special properties contents (#contents) and all (#all). 
There may also be additional format-specific properties that cannot be matched 
(for example, #HtmlHRef for HTML pages).</P></LI></UL>
<P><A name=PropertyNames><B>Property Names</B></A></P>
<P>Property names are preceded by either the “at” (@) or number sign (#) 
character. Use @ for relational queries, and # for regular expression queries. 
</P>
<P>If no property name is specified, @contents is assumed.&gt;</P>
<P>Properties available for all files include: </P>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="40%" bgColor=#cccccc>Property Name</TH>
<TH vAlign=bottom align=left width="60%" bgColor=#cccccc>Description</TH></TR>
<TR>
<TD vAlign=top width="40%">All</TD>
<TD vAlign=top width="60%">Matches any property</TD></TR>
<TR>
<TD vAlign=top width="40%">Contents</TD>
<TD vAlign=top width="60%">Words and phrases in the file and textual 
properties</TD></TR>
<TR>
<TD vAlign=top width="40%">Filename</TD>
<TD vAlign=top width="60%">Name of the file</TD></TR>
<TR>
<TD vAlign=top width="40%">Size</TD>
<TD vAlign=top width="60%">File size</TD></TR>
<TR>
<TD vAlign=top width="40%">Write</TD>
<TD vAlign=top width="60%">Last time the file was 
modified</TD></TR></TBODY></TABLE>
<P>ActiveX property values can also be used in queries. Web sites with files 
created by most ActiveX-aware applications can be queried for these 
properties:</P>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="40%" bgColor=#cccccc>Property Name</TH>
<TH vAlign=bottom align=left width="60%" bgColor=#cccccc>Description </TH></TR>
<TR>
<TD vAlign=top width="40%">DocTitle</TD>
<TD vAlign=top width="60%">Title of the document</TD></TR>
<TR>
<TD vAlign=top width="40%">DocSubject</TD>
<TD vAlign=top width="60%">Subject of the document </TD></TR>
<TR>
<TD vAlign=top width="40%">DocAuthor</TD>
<TD vAlign=top width="60%">The document’s author </TD></TR>
<TR>
<TD vAlign=top width="40%">DocKeywords</TD>
<TD vAlign=top width="60%">Keywords for the document </TD></TR>
<TR>
<TD vAlign=top width="40%">DocComments</TD>
<TD vAlign=top width="60%">Comments about the document 
</TD></TR></TBODY></TABLE>
<P>For a complete list of property names, see the <A 
href="#PropertyNamesList">List of Property Names</A> later on this page.</P>
<P><A name=RelationalOperators><B>Relational Operators</B></A></P>
<P>Relational operators are used in relational property queries. </P>
<DIV align=left>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>To Search For</TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>Example</TH>
<TH vAlign=bottom align=left width="33%" bgColor=#cccccc>Results</TH></TR>
<TR>
<TD vAlign=top width="33%">Property values in relation to a fixed value </TD>
<TD vAlign=top width="33%">@size &lt; 100 <BR>@size &lt;= 100 <BR>@size = 100 
<BR>@size != 100 <BR>@size &gt;= 100 <BR>@size &gt; 100 </TD>
<TD vAlign=top width="33%">Files whose size matches the query</TD></TR>
<TR>
<TD vAlign=top width="33%">Property values with all of a set of bits on </TD>
<TD vAlign=top width="33%">@attrib ^a 0x820</TD>
<TD vAlign=top width="33%">Compressed files with the archive bit on </TD></TR>
<TR>
<TD vAlign=top width="33%">Property values with some of a set of bits on </TD>
<TD vAlign=top width="33%">@attrib ^s 0x20</TD>
<TD vAlign=top width="33%">Files with the archive bit on 
</TD></TR></TBODY></TABLE></DIV>
<P><A name=PropertyValues><B>Property Values</B></A></P>
<DIV align=left>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width=130 bgColor=#cccccc>To Search For</TH>
<TH vAlign=bottom align=left width=200 bgColor=#cccccc>Example</TH>
<TH vAlign=bottom align=left width=170 bgColor=#cccccc>Results</TH></TR>
<TR>
<TD vAlign=top width="33%">A specific value</TD>
<TD vAlign=top width="33%">@DocAuthor = Bill Barnes </TD>
<TD vAlign=top width="33%">Files authored by “Bill Barnes”</TD></TR>
<TR>
<TD vAlign=top width="33%">Values beginning with a prefix</TD>
<TD vAlign=top width="33%">#DocAuthor George* </TD>
<TD vAlign=top width="33%">Files whose author property begins with “George” 
</TD></TR>
<TR>
<TD vAlign=top width="33%">Files with any of a set of extensions</TD>
<TD vAlign=top width="33%">#filename *.|(exe|,dll|,sys|) </TD>
<TD vAlign=top width="33%">Files with .exe, .dll, or .sys extensions </TD></TR>
<TR>
<TD vAlign=top width="33%">Files modified after a certain date</TD>
<TD vAlign=top width="33%">@write &gt; 96/2/14 10:00:00</TD>
<TD vAlign=top width="33%">Files modified after February 14, 1996 at 10:00 
GMT</TD></TR>
<TR>
<TD vAlign=top width="33%">Files modified after a relative date</TD>
<TD vAlign=top width="33%">@write &gt; -1d2h</TD>
<TD vAlign=top width="33%">Files modified in the last 26 hours</TD></TR>
<TR>
<TD vAlign=top width="33%">Vectors matching a vector</TD>
<TD vAlign=top width="33%">@vectorprop = { 10, 15, 20 }</TD>
<TD vAlign=top width="33%">ActiveX documents with a vectorprop value of { 10, 
15, 20 }</TD></TR>
<TR>
<TD vAlign=top width="33%">Vectors where each value matches a criteria</TD>
<TD vAlign=top width="33%">@vectorprop &gt;^a 15</TD>
<TD vAlign=top width="33%">ActiveX documents with a vectorprop value in which 
all values in the vector are greater than 15</TD></TR>
<TR>
<TD vAlign=top width="33%">Vectors where at least one value matches a 
criteria</TD>
<TD vAlign=top width="33%">@vectorprop =^s 15</TD>
<TD vAlign=top width="33%">ActiveX documents with a vectorprop value in which at 
least one value is 15</TD></TR></TBODY></TABLE></DIV>
<UL>
<LI>
<P align=left>Be sure to use the pound (#) character before the property name 
when using a regular expression in a property value, and an “at” (@) character 
otherwise. The equal (=) relational operator is assumed for regular-expression 
queries.</P>
<LI>
<P align=left>File name (#filename) is the only property that supports regular 
expressions with wildcards to the left of text. This is the only case where 
wildcards to the left are efficient.</P>
<LI>
<P align=left>Date and time values are of the form yyyy/mm/dd hh:mm:ss. The 
first two characters of the year and the entire time can be omitted. Dates and 
times are in Greenwich Mean Time (GMT).</P>
<LI>
<P align=left>Dates and times relative to the current time can be expressed with 
a minus (-) character followed by zero or by more integer unit and time unit 
pairs. Time units are expressed as: (y) for years, (m) for months, (w) for 
weeks, (d) for days, (h) for hours, (n) for minutes, and (s) for seconds.</P>
<LI>
<P align=left>Currency values are of the form x.y, where x is the whole value 
amount and y is the fractional amount. There is no assumption about units.</P>
<LI>
<P align=left>Boolean values are (t) or (true) for TRUE and (f) or (false) for 
FALSE.</P>
<LI>
<P align=left>Vectors (VT_VECTOR) are expressed as an opening brace ({), 
followed by a comma-separated list of values, then a closing brace (}).</P>
<LI>
<P align=left>Single-value expressions that are compared against vectors are 
expressed as a <A href="#RelationalOperators">relational operator</A>, then a 
(^a) for all of or a (^s) for some of.</P>
<LI>
<P align=left>Numeric values can be in decimal or hexadecimal (preceded by 
0x).</P>
<LI>
<P align=left>The contents property does not support relational operators. If a 
relational operator is specified, no results will be found. For example, 
@contents Microsoft will find documents containing Microsoft, but 
@contents=Microsoft will find none. </P></LI></UL>
<P><A name=RegularExpressions><B>Regular Expressions</B></A></P>
<P>Regular expressions in property queries are defined as follows: 
<UL>
<LI>
<P align=left>Any character except asterisk (*), period (.), question mark (?), 
and vertical bar (|) defaults to matching just itself.</P>
<LI>
<P align=left>Regular expressions can be enclosed in matching quotes (“), and 
must be enclosed in quotes if they contain a space ( ) or closing parenthesis 
()).</P>
<LI>
<P align=left>The characters *, ., and ? behave as they behave in Windows; they 
match any number of characters, match (.) or end of string, and match any one 
character, respectively.</P>
<LI>
<P align=left>The character | is an escape character. After |, the following 
characters have special meaning: </P>
<UL>
<LI>( opens a group. Must be followed by a matching ). 
<LI>) closes a group. Must be preceded by a matching (. 
<LI>[ opens a character class. Must be followed by a matching (un-escaped) ]. 
<LI>{ opens a counted match. Must be followed by a matching }. 
<LI>} closes a counted match. Must be preceded by a matching {. 
<LI>, separates OR clauses. 
<LI>* matches zero or more occurrences of the preceding expression. 
<LI>? matches zero or one occurrences of the preceding expression. 
<LI>+ matches one or more occurrences of the preceding expression. 
<LI>
<P align=left>Anything else, including |, matches itself.</P></LI></UL>
<LI>
<P align=left>Between square brackets ([]) the following characters have special 
meaning:</P>
<UL>
<LI>^ matches everything but following classes. Must be the first character. 
<LI>] matches ]. May only be preceded by ^, otherwise it closes the class. 
<LI>- range operator. Preceded and followed by normal characters. 
<LI>
<P align=left>Anything else matches itself (or begins or ends a range at 
itself).</P></LI></UL>
<LI>
<P align=left>Between curly braces ({}) the following syntax applies:</P>
<UL>
<LI>|{m|} matches exactly m occurrences of the preceding expression. (0 &lt; m 
&lt; 256). 
<LI>|{m,|} matches at least m occurrences of the preceding expression. (1 &lt; m 
&lt; 256). 
<LI>
<P align=left>|{m,n|} matches between m and n occurrences of the preceding 
expression, inclusive. (0 &lt; m &lt; 256, 0 &lt; n &lt; 256).</P></LI></UL>
<LI>
<P align=left>To match *, ., and ?, enclose them in brackets (for example, 
|[*]sample will match “*sample”).</P></LI></UL>
<H4><A name=Examples>Query Examples</A></H4>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="40%" bgColor=#cccccc>Example</TH>
<TH vAlign=bottom align=left width="60%" bgColor=#cccccc>Results</TH></TR>
<TR>
<TD vAlign=top width="40%">@size &gt; 1000000</TD>
<TD vAlign=top width="60%">Pages larger than one million bytes</TD></TR>
<TR>
<TD vAlign=top width="40%">@write &gt; 95/12/23</TD>
<TD vAlign=top width="60%">Pages modified after the date</TD></TR>
<TR>
<TD vAlign=top width="40%">Apple tree</TD>
<TD vAlign=top width="60%">Pages with the phrase “apple tree”</TD></TR>
<TR>
<TD vAlign=top width="40%">"apple tree"</TD>
<TD vAlign=top width="60%">Same as above</TD></TR>
<TR>
<TD vAlign=top width="40%">@contents apple tree</TD>
<TD vAlign=top width="60%">Same as above</TD></TR>
<TR>
<TD vAlign=top width="40%">Microsoft and @size &gt; 1000000</TD>
<TD vAlign=top width="60%">Pages with the word “Microsoft” that are larger than 
one million bytes</TD></TR>
<TR>
<TD vAlign=top width="40%">"microsoft and @size &gt; 1000000"</TD>
<TD vAlign=top width="60%">Pages with the phrase specified (not the same as 
above)</TD></TR>
<TR>
<TD vAlign=top width="40%">#filename *.avi</TD>
<TD vAlign=top width="60%">Video files (the # prefix is used because the query 
contains a regular expression)</TD></TR>
<TR>
<TD vAlign=top width="40%">@attrib ^s 32</TD>
<TD vAlign=top width="60%">Pages with the archive attribute bit on</TD></TR>
<TR>
<TD vAlign=top width="40%">@docauthor = John Smith</TD>
<TD vAlign=top width="60%">Pages with the given author</TD></TR>
<TR>
<TD vAlign=top width="40%">$contents why is the sky blue?</TD>
<TD vAlign=top width="60%">Pages that match the query</TD></TR>
<TR>
<TD vAlign=top width="40%">@size &lt; 100 &amp; #filename *.gif</TD>
<TD vAlign=top width="60%">Graphics Interchange Format (GIF) files less than 100 
bytes in size</TD></TR></TBODY></TABLE>
<H4><A name=PropertyNamesList>List of Property Names</A></H4>
<P>These properties are always available for queries. Additional properties may 
also be available depending on the configuration of the Web server.</P>
<DIV align=left>
<TABLE cellSpacing=0 cellPadding=5 width="100%" border=1>
<TBODY>
<TR>
<TH vAlign=bottom align=left width="15%" bgColor=#cccccc>Friendly Name</TH>
<TH vAlign=bottom align=left width="20%" bgColor=#cccccc>Datatype</TH>
<TH vAlign=bottom align=left width="65%" bgColor=#cccccc>Property</TH></TR>
<TR>
<TD vAlign=top width="15%">Access</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Last time file was accessed.</TD></TR>
<TR>
<TD vAlign=top width="15%">All</TD>
<TD vAlign=top width="20%">(not applicable)</TD>
<TD vAlign=top width="65%">Searches every property for a string. Can be queried 
but not retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">AllocSize</TD>
<TD vAlign=top width="20%">DBTYPE_I8</TD>
<TD vAlign=top width="65%">Size of disk allocation for file.</TD></TR>
<TR>
<TD vAlign=top width="15%">Attrib</TD>
<TD vAlign=top width="20%">DBTYPE_UI4</TD>
<TD vAlign=top width="65%">File attributes. Documented in Win32 SDK.</TD></TR>
<TR>
<TD vAlign=top width="15%">ClassId</TD>
<TD vAlign=top width="20%">DBTYPE_GUID</TD>
<TD vAlign=top width="65%">Class ID of object, for example, WordPerfect, Word, 
and so on.</TD></TR>
<TR>
<TD vAlign=top width="15%">Change</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Last time file was changed (includes changes to 
attributes).</TD></TR>
<TR>
<TD vAlign=top width="15%"><A name=Characterization>Characterization</A></TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Characterization, or abstract, of document. Computed 
by Index Server.</TD></TR>
<TR>
<TD vAlign=top width="15%">Contents</TD>
<TD vAlign=top width="20%">(not applicable)</TD>
<TD vAlign=top width="65%">Main contents of file. Can be queried but not 
retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">Create</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Time file was created.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocAppName</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Name of application that created the file.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocAuthor</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Author of document.</TD></TR>
<TR>
<TD>DocCategory</TD>
<TD>DBTYPE_STR</TD>
<TD>Type of document such as a memo, schedule, or whitepaper.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocCharCount</TD>
<TD vAlign=top width="20%">DBTYPE_I4</TD>
<TD vAlign=top width="65%">Number of characters in document.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocComments</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Comments about document.</TD></TR>
<TR>
<TD>DocCompany</TD>
<TD>DBTYPE_STR</TD>
<TD>Name of the company for which the document was written.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocCreatedTm</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Time document was created.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocEditTime</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Total time spent editing document.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocKeywords</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Document keywords.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocLastAuthor</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Most recent user who edited document.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocLastPrinted</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Time document was last printed.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocLastSavedTm</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Time document was last saved.</TD></TR>
<TR>
<TD>DocManager</TD>
<TD>DBTYPE_STR</TD>
<TD>Name of the manager of the document’s author.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocPageCount</TD>
<TD vAlign=top width="20%">DBTYPE_I4</TD>
<TD vAlign=top width="65%">Number of pages in document.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocRevNumber</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Current version number of document.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocSubject</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Subject of document.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocTemplate</TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Name of template for document.</TD></TR>
<TR>
<TD vAlign=top width="15%"><A name=DocTitle>DocTitle</A></TD>
<TD vAlign=top width="20%">DBTYPE_STR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Title of document.</TD></TR>
<TR>
<TD vAlign=top width="15%">DocWordCount</TD>
<TD vAlign=top width="20%">DBTYPE_I4</TD>
<TD vAlign=top width="65%">Number of words in document.</TD></TR>
<TR>
<TD vAlign=top width="15%">FileIndex</TD>
<TD vAlign=top width="20%">DBTYPE_I8</TD>
<TD vAlign=top width="65%">Unique ID of file.</TD></TR>
<TR>
<TD vAlign=top width="15%"><A name=FileName>FileName</A></TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Name of file.</TD></TR>
<TR>
<TD vAlign=top width="15%">HitCount</TD>
<TD vAlign=top width="20%">DBTYPE_I4</TD>
<TD vAlign=top width="65%">Number of hits (words matching query) in 
file.</TD></TR>
<TR>
<TD vAlign=top width="15%">HtmlHRef</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Text of HTML HREF. Can be queried but not 
retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">HtmlHeading1</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Text of HTML document in style H1. Can be queried but 
not retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">HtmlHeading2</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Text of HTML document in style H2. Can be queried but 
not retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">HtmlHeading3</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Text of HTML document in style H3. Can be queried but 
not retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">HtmlHeading4</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Text of HTML document in style H4. Can be queried but 
not retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">HtmlHeading5</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Text of HTML document in style H5. Can be queried but 
not retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%">HtmlHeading6</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Text of HTML document in style H6. Can be queried but 
not retrieved.</TD></TR>
<TR>
<TD vAlign=top width="15%"><A name=Path>Path</A></TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Full physical path to file, including file 
name.</TD></TR>
<TR>
<TD vAlign=top width="15%">Rank</TD>
<TD vAlign=top width="20%">DBTYPE_I4</TD>
<TD vAlign=top width="65%">Rank of row. Ranges from 0 to 1000. Larger numbers 
indicate better matches.</TD></TR>
<TR>
<TD vAlign=top width="15%">RankVector</TD>
<TD vAlign=top width="20%">DBTYPE_I4 | DBTYPE_VECTOR</TD>
<TD vAlign=top width="65%">Ranks of individual components of a <A 
href="#VectorQueries">vector query</A>.</TD></TR>
<TR>
<TD vAlign=top width="15%">SecurityChange</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Last time security was changed on file.</TD></TR>
<TR>
<TD vAlign=top width="15%">ShortFileName</TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Short (8.3) file name.</TD></TR>
<TR>
<TD vAlign=top width="15%">Size</TD>
<TD vAlign=top width="20%">DBTYPE_I8</TD>
<TD vAlign=top width="65%">Size of file, in bytes.</TD></TR>
<TR>
<TD vAlign=top width="15%">USN</TD>
<TD vAlign=top width="20%">DBTYPE_I8</TD>
<TD vAlign=top width="65%">Update Sequence Number. NTFS drives only.</TD></TR>
<TR>
<TD vAlign=top width="15%"><A name=VPath>VPath</A></TD>
<TD vAlign=top width="20%">DBTYPE_WSTR | DBTYPE_BYREF</TD>
<TD vAlign=top width="65%">Full virtual path to file, including file name. If 
more than one possible path, then the best match for the specific query is 
chosen.</TD></TR>
<TR>
<TD vAlign=top width="15%">WorkId</TD>
<TD vAlign=top width="20%">DBTYPE_I4</TD>
<TD vAlign=top width="65%">Internal ID for file. Used within Index 
Server.</TD></TR>
<TR>
<TD vAlign=top width="15%">Write</TD>
<TD vAlign=top width="20%">DBTYPE_DATE</TD>
<TD vAlign=top width="65%">Last time file was 
written.</TD></TR></TBODY></TABLE></DIV>
<P><STRONG><A href="tips.asp">Tips for Searching</A></STRONG></P></TD></TR>
 </table>  
</body>
</html>
