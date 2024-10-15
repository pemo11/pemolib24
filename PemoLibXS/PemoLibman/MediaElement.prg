// MediaElement.prg

USING System

BEGIN NAMESPACE PemoLibmanV1

	/// <summary>
    /// The MediaElement class
    /// </summary>
	CLASS MediaElement
        PRIVATE id AS GUID

        PROPERTY id AS STRING
            GET
                RETURN SELF.id:ToString()
            END GET
        END PROPERTY

        CONSTRUCTOR()
            id := GUID.NewGuid()

         RETURN

	END CLASS
END NAMESPACE // PemoLibman