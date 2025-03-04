unit umain;

interface

uses

  //additional
  System.Math,

  //autogenerate
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.NumberBox, Vcl.Grids,
  RzGrids, RzTabs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    nbInitial: TNumberBox;
    lb1: TLabel;
    lb2: TLabel;
    nbIncrement: TNumberBox;
    btn1: TButton;
    lb3: TLabel;
    lb4: TLabel;
    nbCount: TNumberBox;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    sgData: TRzStringGrid;
    sgDataBase: TRzStringGrid;
    TabSheet3: TRzTabSheet;
    lb5: TLabel;
    lb6: TLabel;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDQuery1: TFDQuery;
    mmo1: TMemo;
    btn2: TButton;
    NumberBox1: TNumberBox;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    NumberBox2: TNumberBox;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

const
  sLineBreak = {$IFDEF LINUX} AnsiChar(#10) {$ENDIF}
               {$IFDEF MSWINDOWS} AnsiString(#13#10) {$ENDIF};

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var i : integer;
    xSingle : Single;
    xDouble : Double;
    xExtended : Extended;

    tempData : WideString;
begin

  TabSheet1.Show;

  { TODO : kosongkan grid }
  with sgData do
    begin

      ColCount:=1;
      RowCount:=1;

      FixedCols:=0;
      FixedRows:=0;

    end;

  with sgDataBase do
    begin

      ColCount:=1;
      RowCount:=1;

      FixedCols:=0;
      FixedRows:=0;

    end;

  { TODO : lakukan looping dan input data ke grid - tabel 1}
  with sgData do
    begin

      ColCount:=4;
      RowCount:=nbCount.ValueInt+1;

      FixedCols:=1;
      FixedRows:=1;

      ColWidths[0]:=30;
      ColWidths[1]:=110;
      ColWidths[2]:=110;
      ColWidths[3]:=110;

      Cells[0,0]:='No.';
      Cells[1,0]:='Single';
      Cells[2,0]:='Double/Real';
      Cells[3,0]:='Extended';

      xSingle   := nbInitial.Value;
      xDouble   := nbInitial.Value;
      xExtended := nbInitial.Value;

      for I := 1 to nbCount.ValueInt do
        begin
          Cells[0,I]:=I.ToString;
          Cells[1,I]:=xSingle.ToString;
          Cells[2,I]:=xDouble.ToString;
          Cells[3,I]:=xExtended.ToString;

          xSingle   := xSingle    + nbIncrement.Value;
          xDouble   := xDouble    + nbIncrement.Value;
          xExtended := xExtended  + nbIncrement.Value;

        end;

    end;

  { TODO : clear table }

  try
      with FDQuery1 do
      begin
        Close;
        SQL.Text:='truncate tbl_floating';
        ExecSQL;
      end;

      //ShowMessage('data berhasil dikosongkan!');
  except on E: Exception do ShowMessage(E.Message)
  end;

  { TODO : Input data ke database }
  tempData := 'insert into tbl_floating (`cSingle`,`cDouble`,`cExtended`) values '+sLineBreak;

  xSingle   := nbInitial.Value;
  xDouble   := nbInitial.Value;
  xExtended := nbInitial.Value;

  for I := 1 to nbCount.ValueInt do
    begin
      tempData := tempData + '('+xSingle.ToString+','+xDouble.ToString+','+xExtended.ToString+'),';

      xSingle   := xSingle    + nbIncrement.Value;
      xDouble   := xDouble    + nbIncrement.Value;
      xExtended := xExtended  + nbIncrement.Value;
    end;


  mmo1.Text:=tempData;
  lb5.Caption:=mmo1.GetTextLen.ToString;

  mmo1.Text:=copy(mmo1.Text, 0, StrToInt(lb5.Caption)-1);

  lb6.Caption:=mmo1.GetTextLen.ToString;

  try
      with FDQuery1 do
      begin
        Close;
        SQL.Text:=mmo1.Text;
        ExecSQL;
      end;

      //ShowMessage('data berhasil diinputkan!');
  except on E: Exception do ShowMessage(E.Message)
  end;

  { TODO : ambil data dari database dan tampilkan di tabel 2 }
  try
      with FDQuery1 do
      begin
        Close;
        SQL.Text:='select * from tbl_floating';
        Open();
      end;

  with sgDataBase do
    begin

      ColCount:=4;
      RowCount:=FDQuery1.RecordCount+1;

      FixedCols:=1;
      FixedRows:=1;

      ColWidths[0]:=30;
      ColWidths[1]:=110;
      ColWidths[2]:=110;
      ColWidths[3]:=110;

      Cells[0,0]:='No.';
      Cells[1,0]:='Single';
      Cells[2,0]:='Double/Real';
      Cells[3,0]:='Extended';

      FDQuery1.First;
      while not FDQuery1.Eof do
        begin
          //RowHeights[FDQuery1.RecNo]:=fmain.rsx(20);
          //RowHeights[FDQuery1.RecNo]:=fmain.GridRowHeight;
          Cells[0,FDQuery1.RecNo]:=IntToStr(FDQuery1.RecNo);
          Cells[1,FDQuery1.RecNo]:=FDQuery1.FieldByName('cSingle').AsString;
          Cells[2,FDQuery1.RecNo]:=FDQuery1.FieldByName('cDouble').AsString;
          Cells[3,FDQuery1.RecNo]:=FDQuery1.FieldByName('cExtended').AsString;
          FDQuery1.Next;
        end;

    end;


      //ShowMessage('data berhasil diinputkan!');
  except on E: Exception do ShowMessage(E.Message)
  end;


end;

procedure TForm1.btn2Click(Sender: TObject);
var xfloat, xMod : extended;
begin

  xfloat:=NumberBox1.Value;
  xMod  :=NumberBox2.Value;

  edt1.Text := NumberBox1.ValueFloat.ToString;

  edt3.Text := FMod(xFloat, xMod).ToString;

  if FMod(xFloat, xMod) = 0
  then edt2.Text:=xFloat.ToString
  else edt2.Text:=xFloat.ToString + '0'
  ;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  // SET SETTING VARIABLE
    FormatSettings.DecimalSeparator :='.';
    FormatSettings.shortdateformat  :='yyyy-mm-dd';


  { TODO : kosongkan grid }
  with sgData do
    begin

      ColCount:=1;
      RowCount:=1;

      FixedCols:=0;
      FixedRows:=0;

    end;


end;

end.
