// File: PLibManager.prg

USING System
USING System.Linq
USING System.Collections.Generic

BEGIN NAMESPACE PemoLibmanV1

    ENUM LibMediaType
        Book
        NonBook
    END ENUM

    STATIC CLASS LibManager
        PRIVATE STATIC _mediaList AS List<MediaElement>
        
        /// <summary>
        /// Initialize Collections
        /// </summary>
        STATIC CONSTRUCTOR()
            _mediaList := List<MediaElement>{}
            
        /// <summary>
        /// Creates a new book element
        /// </summary>
        /// <param name="Isbn"></param>
        /// <returns></returns>
        STATIC METHOD CreateBookElement(Isbn AS STRING) AS BookElement
            VAR newBook := BookElement{Isbn}
            _mediaList:Add(newBook)
            RETURN newBook
            
        /// <summary>
        /// Removes a specific book element
        /// </summary>
        /// <param name="Isbn"></param>
        /// <returns></returns>
        STATIC METHOD RemoveBookElement(Isbn AS STRING) AS LOGIC
            VAR Book := _mediaList:Cast<BookElement>():Where({m => String.Compare(m:Isbn, Isbn) == 0}):FirstOrDefault()
            IF Book != NULL
                _mediaList:Remove(Book)
                RETURN TRUE
            ELSE
                RETURN FALSE
            END IF
            
        /// <summary>
        /// Remove all book elements
        /// </summary>
        /// <returns></returns>
        STATIC METHOD RemoveAllBookElements() AS INT
            _mediaList:RemoveAll({m => m IS BookElement})
            RETURN _mediaList:Count
            
        /// <summary>
        /// Gets a specific book element
        /// </summary>
        /// <param name="Isbn"></param>
        /// <returns></returns>
        STATIC METHOD GetBookElement(Isbn AS STRING) AS BookElement
            VAR Book := _mediaList:Cast<BookElement>():Where({m => String.Compare(m:Isbn, Isbn) == 0}):FirstOrDefault()
            RETURN Book
            
        /// <summary>
        /// Get all media elements of a certain type
        /// </summary>
        /// <param name="Type"></param>
        /// <returns></returns>
        STATIC METHOD GetMediaElements(Type AS LibMediaType) AS List<MediaElement>
            RETURN _mediaList:Where({m => m IS BookElement}):ToList()

    END CLASS

END NAMESPACE // PemoLibman
