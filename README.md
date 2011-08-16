Dixcart Retriever
============

Retriever is an front-end for Microsoft Indexing Server, allowing your staff to search all documents on your system.  The meat of the technology is built into all Windows Servers, and just needs to be installed/enabled then Retriever added on top to be able to search.

For Retriever to do anything, you must have installed the Indexing Service and created a catalog.  Indexing server can handle many file types through additional iFilters which can be downloaded for free or paid for.

For some more details, see [my answer on Stack Overflow](http://stackoverflow.com/questions/6817291/indexing-files-and-searching-them-through-web-application/6830824#6830824), which led to this being open sourced.

Install
---------

Create a site in IIS and drop the files in.  All settings you need should be in `/includes/settings.inc.asp` and are documented in there.  To use as a search provider in IE, you will need to modify `/assets/files/ExampleProvider.xml`.

License
-----------
<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons Licence" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/InteractiveResource" property="dct:title" rel="dct:type">Dixcart Retriever</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://dixcart.com/it" property="cc:attributionName" rel="cc:attributionURL">Dixcart Technical Solutions Limited</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.