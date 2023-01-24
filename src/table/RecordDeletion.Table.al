table 50200 "Record Deletion"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Table ID"; Integer)
        {
            Caption = 'Table ID', Comment = 'ESP="ID Tabla"';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Table Name"; Text[250])
        {
            Caption = 'Table Name', Comment = 'ESP="Nombre Tabla"';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(AllObjWithCaption."Object Name" where("Object Type" = const(Table), "Object ID" = field("Table ID")));
        }
        field(20; "No. of Records"; Integer)
        {
            Caption = 'No. of Records', Comment = 'ESP="No. Registros"';
            Editable = false;
            FieldClass = FlowField;
            //CalcFormula = lookup ("Table Information"."No. of Records" where("Company Name" = field(Company), "Table No." = field("Table ID")));
            //CalcFormula = lookup ("Table Information"."No. of Records" where("Company Name" = field(Company), "Table No." = field("Table ID")));
        }
        field(21; "No. of Table Relation Errors"; Integer)
        {
            Caption = 'No. of Table Relation Errors', Comment = 'ESP="No. Errores TableRelation"';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Count("Record Deletion Rel. Error" where("Table ID" = field("Table ID")));
        }
        field(30; "Delete Records"; Boolean)
        {
            Caption = 'Delete Records', Comment = 'ESP="Borrar Registros"';
            DataClassification = ToBeClassified;
        }
        field(40; Company; Text[30])
        {
            Caption = 'Company', Comment = 'ESP="Empresa"';
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "Table ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Company := CopyStr(CompanyName, 1, MaxStrLen(Company));
    end;

}