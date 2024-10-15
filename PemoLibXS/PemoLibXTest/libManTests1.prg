// file: libManTests1.prg

USING System
USING System.Collections.Generic
USING System.Linq

USING Xunit

USING PemoLibmanV1

BEGIN NAMESPACE PemoLibXTest

    CLASS TestClass
        
        CONSTRUCTOR()
            LibManager.RemoveAllBookElements()

		[Fact];
        METHOD CreateBookElementX1 AS VOID  STRICT
		    VAR book1 := LibManager.CreateBookElement("1234")
            Assert.True(book1 != NULL)
            RETURN

		[Fact];
        METHOD GetBookCountX() AS VOID STRICT
            VAR book1 := LibManager.CreateBookElement("1234")
            VAR bookList := LibManager.GetMediaElements(LibMediaType.Book)
		    Assert.True(bookList:Count == 1)
            RETURN

		[Fact];
        METHOD GetSingleBookX1() AS VOID STRICT
            VAR isbn := "1234"
            VAR book1 := LibManager.CreateBookElement(isbn)
            VAR book2 := LibManager.GetBookElement(isbn)
		    Assert.True(book2 != NULL)
            RETURN

		[Fact];
        METHOD RemoveBookX1() AS VOID STRICT
            VAR book1 := LibManager.CreateBookElement("1234")
            LibManager.RemoveBookElement(book1:Isbn)
            VAR bookList := LibManager.GetMediaElements(LibMediaType.Book)
		    Assert.True(bookList:Count == 0)
            RETURN
    END CLASS

END NAMESPACE
