// file: libmanTests1.prg

USING System
USING System.Collections.Generic
USING System.Linq
USING System.Text
using Microsoft.VisualStudio.TestTools.UnitTesting

USING PemoLibmanV1

BEGIN NAMESPACE PemolibTest

    [TestClass]	;
	CLASS TestClass

	    [TestMethod];
        METHOD CreateBookElement1 AS VOID  STRICT
		    VAR book1 := LibManager.CreateBookElement("1234")
		    Assert.IsNotNull(book1)
            RETURN

	    [TestMethod];
        METHOD GetBookCount() AS VOID STRICT
            VAR book1 := LibManager.CreateBookElement("1234")
            VAR bookList := LibManager.GetMediaElements(LibMediaType.Book)
		    Assert.IsNotNull(bookList:Count == 1)
            RETURN

        [TestMethod];
        METHOD GetSingleBook1() AS VOID STRICT
            VAR isbn := "1234"
            VAR book1 := LibManager.CreateBookElement(isbn)
            VAR book2 := LibManager.GetBookElement(isbn)
		    Assert.IsNotNull(book2)
            RETURN

	    [TestMethod];
        METHOD RemoveBook1() AS VOID STRICT
            VAR book1 := LibManager.CreateBookElement("1234")
            VAR bookList := LibManager.GetMediaElements(LibMediaType.Book)
            LibManager.RemoveBookElement(book1:Isbn)
		    Assert.IsNotNull(bookList:Count == 0)
            RETURN

	END CLASS
END NAMESPACE
