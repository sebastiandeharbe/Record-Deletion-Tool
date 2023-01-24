page 50200 "Record Deletion"
{

    PageType = List;
    SourceTable = "Record Deletion";
    Caption = 'Record Deletion', Comment = 'ESP="Borrador de Registros"';
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Table ID field.', Comment = 'ESP="Especifica el valor del campo ID de la tabla"';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Table Name field.';
                }
                field(NoOfRecords; RecordDeletionMgt.CalcRecordsInTable(Rec."Table ID"))
                {
                    Caption = 'No. of Records', comment = 'ESP="No. Registros"';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CalcRecordsInTable(Rec.Table ID) field.';

                }
                field("No. of Table Relation Errors"; Rec."No. of Table Relation Errors")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. of Table Relation Errors field.';
                }
                field("Delete Records"; Rec."Delete Records")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Delete Records field.';
                }
                // field(Company; Company)
                // {
                //     ApplicationArea = All;
                // }
            }
        }
    }
    actions
    {
        area(Navigation)
        {

        }
        area(Processing)
        {
            action(InsertUpdateTables)
            {
                ApplicationArea = All;
                Caption = 'Insert/Update Tables', Comment = 'ESP="Insertar/Actualizar Tablas"';
                Promoted = true;
                PromotedIsBig = true;
                Image = Refresh;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Executes the InsertUpdateTables action.';
                trigger OnAction()
                begin
                    RecordDeletionMgt.InsertUpdateTables();
                end;
            }
            action(SuggestsRecords)
            {
                ApplicationArea = All;
                Caption = 'Suggest Records to Delete', Comment = 'ESP ="Sugerir registros para eliminar"';
                Promoted = true;
                PromotedIsBig = true;
                Image = Suggest;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Executes the SuggestsRecords action.', Comment = 'ESP="Ejecuta la acción de registro de sugerencias."';
                trigger OnAction()
                begin
                    RecordDeletionMgt.SuggestRecordsToDelete();
                end;
            }
            action(SuggestsUnlicensedPartnerOrCustomRecords)
            {
                ApplicationArea = All;
                Caption = 'Suggest Unlicensed Partner or Custom Records to Delete', Comment = 'ESP="Sugerir registros de partner o personalizados para eliminar"';
                Promoted = true;
                PromotedIsBig = true;
                Image = Suggest;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    RecordDeletionMgt.SuggestUnlicensedPartnerOrCustomRecordsToDelete();
                end;
            }
            action(ClearRecords)
            {
                ApplicationArea = All;
                Caption = 'Clear Records to Delete', Comment = 'ESP="Limpiar registros para eliminar"';
                Promoted = true;
                PromotedIsBig = true;
                Image = Delete;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Executes the ClearRecords action.';
                trigger OnAction()
                begin
                    RecordDeletionMgt.ClearRecordsToDelete();
                end;
            }
            action(DeleteRecords)
            {
                ApplicationArea = All;
                Caption = 'Delete Records (no trigger!)', Comment = 'ESP="Borrar Registros (sin trigger)"';
                ;
                Promoted = true;
                PromotedIsBig = true;
                Image = Delete;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Executes the DeleteRecords action.';
                trigger OnAction()
                begin
                    RecordDeletionMgt.DeleteRecords(false);
                end;
            }
            action(DeleteRecordsWithTrigger)
            {
                ApplicationArea = All;
                Caption = 'Delete Records (with trigger!)', Comment = 'ESP="Borrar Registros (con trigger!)"';
                ;
                Promoted = true;
                PromotedIsBig = true;
                Image = Delete;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Executes the DeleteRecordsWithTrigger action.';
                trigger OnAction()
                begin
                    RecordDeletionMgt.DeleteRecords(true);
                end;
            }
            action(CheckTableRelations)
            {
                ApplicationArea = All;
                Caption = 'Check Table Relations', comment = 'ESP="Verificar Relaciones de Tabla"';
                Promoted = true;
                PromotedIsBig = true;
                Image = Relationship;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    RecordDeletionMgt.CheckTableRelations();
                end;
            }
            action(ViewRecords)
            {
                ApplicationArea = All;
                Caption = 'View Records', Comment = 'ESP="Ver Registros"';
                ;
                Promoted = true;
                PromotedIsBig = true;
                Image = Table;
                PromotedCategory = Process;
                PromotedOnly = true;
                trigger OnAction()
                begin
                    RecordDeletionMgt.ViewRecords(Rec);
                end;
            }
        }

    }
    var
        RecordDeletionMgt: Codeunit "Record Deletion Mgt.";

}
