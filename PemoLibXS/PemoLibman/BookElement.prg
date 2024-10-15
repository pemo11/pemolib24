// File: BookElement.prg


USING System
USING System.Collections.Generic

BEGIN NAMESPACE PemoLibmanV1

	/// <summary>
    /// The BookElement class
    /// </summary>
    CLASS BookElement INHERIT MediaElement
        PRIVATE _authors AS List<STRING>
        PRIVATE _title AS STRING
        PRIVATE _isbn AS STRING
        PRIVATE _pubYear AS INT
        PRIVATE _publisherId AS INT

        CONSTRUCTOR(Isbn AS STRING)
            SELF._isbn := Isbn
            RETURN

        PROPERTY Authors AS List<STRING>
            GET
                RETURN SELF._authors
            END GET
            SET
                SELF._authors := VALUE
            END SET
        END PROPERTY

        PROPERTY Isbn AS STRING
            GET
                RETURN SELF._isbn
            END GET
        END PROPERTY

    END CLASS

END NAMESPACE // PemoLibman