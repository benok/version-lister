unit ListViewUtil;

interface

uses
  Vcl.ComCtrls,
  Winapi.Windows,
  Winapi.Messages,
  Winapi.CommCtrl;

type
  TFuncGetCaption = function(const ItemIndex: Integer; ColNum: Integer): string of object;

procedure ShowSortTriangle(const ListView: TListView; Ascending: Boolean; ColNum, PrevColumn: Integer);
procedure ClearSortTriangle(const ListView: TListView; ColumnToClear: Integer);
procedure AutoResizeColumn(const ListView: TListView; ColNum: Integer; CallBack: TFuncGetCaption);
function FindColumnIndex(const ListView: TListView; pHeader: pNMHdr): integer;

implementation

uses
  System.SysUtils,
  System.Classes;

//http://stackoverflow.com/questions/10254190/tlistitem-objects

procedure ShowSortTriangle(const ListView: TListView; Ascending: Boolean;
    ColNum, PrevColumn: Integer);
var
  Header: HWND;
  Item: THDItem;
begin
  Header := ListView_GetHeader(ListView.Handle);
  if (PrevColumn >= 0) and (PrevColumn <> ColNum) then
  begin
    ZeroMemory(@Item, SizeOf(Item));
    Item.Mask := HDI_FORMAT;
    // Clear the previous arrow
    Header_GetItem(Header, PrevColumn, Item);
    Item.fmt := Item.fmt and not (HDF_SORTUP or HDF_SORTDOWN);//remove both flags
    Header_SetItem(Header, PrevColumn, Item);
  end;

  ZeroMemory(@Item, SizeOf(Item));
  Item.Mask := HDI_FORMAT;
  Header_GetItem(Header, ColNum, Item);
  Item.fmt := Item.fmt and not (HDF_SORTUP or HDF_SORTDOWN);//remove both flags
  if Ascending then
    Item.fmt := Item.fmt or HDF_SORTUP //include the sort ascending flag
  else
    Item.fmt := Item.fmt or HDF_SORTDOWN; //include the sort ascending flag

  Header_SetItem(Header, ColNum, Item);
end;

procedure ClearSortTriangle(const ListView: TListView; ColumnToClear: Integer);
var
  Header: HWND;
  Item: THDItem;
begin
  Header := ListView_GetHeader(ListView.Handle);
  ZeroMemory(@Item, SizeOf(Item));
  Item.Mask := HDI_FORMAT;
  // Clear the previous arrow
  Header_GetItem(Header, ColumnToClear, Item);
  Item.fmt := Item.fmt and not (HDF_SORTUP or HDF_SORTDOWN);//remove both flags
  Header_SetItem(Header, ColumnToClear, Item);
end;

// modified following code.
// http://stackoverflow.com/questions/9255540/how-auto-size-the-columns-width-of-a-list-view-in-virtual-mode

procedure AutoResizeColumn(const ListView: TListView; ColNum: Integer; CallBack: TFuncGetCaption);
var
  S: string;
  I: Integer;
  MaxWidth: Integer;
  ItemWidth: Integer;
begin
  // set the destination column width to the column's caption width
  // later on we'll check if we have a wider item
  MaxWidth := ListView_GetStringWidth(ListView.Handle, PChar(ListView.Columns.Items[ColNum].Caption));
  // iterate through all data items and check if their captions are
  // wider than the currently widest item if so then store that value

  for I := 0 to ListView.Items.Count - 1 do
  begin
    S := CallBack(I, ColNum);
    ItemWidth := ListView_GetStringWidth(ListView.Handle, PChar(S));
    if MaxWidth < ItemWidth then
      MaxWidth := ItemWidth;
  end;

  // here is hard to say what value to use for padding to prevent the
  // string to be truncated; I've found the suggestions to use 6 px
  // for item caption padding and 12 px for subitem caption padding,
  // but a few quick tests confirmed me to use at least 7 px for items
  // and 14 px for subitems
//  if ColNum = 0 then
//    MaxWidth := MaxWidth + 7
//  else
    MaxWidth := MaxWidth + 14;
  // and here we set the column width with caption padding included
  ListView.Columns.Items[ColNum].Width := MaxWidth;
end;


//
// http://casterprojects.googlecode.com/svn-history/r768/Delphi/XE2/Projects/CastersPackage/trunk/CastersPackage.uListViewEx.pas
//
(*
  ListView with ColumnResize events

  Code found on news:borland.* provided by Peter Below (a TeamB member)

  Placing a TProgressBar into a TListView

  http://delphi.about.com/library/weekly/aa053105a.htm

  Here's how to add a progress bar (or any other Delphi
  component) to a ListView control. Plus: full source code
  to the TListViewEx component (TListView descendant) with
  ColumnResize events!


  ~ Zarko Gajic
  http://delphi.about.com
*)
//

function FindColumnIndex(const ListView: TListView; pHeader: pNMHdr): integer;
var
  hwndHeader: HWND;
  iteminfo: THdItem;
  itemindex: Integer;
  buf: array [0..128] of Char;
begin
  Result:=-1;
  hwndHeader:=pHeader^.hwndFrom;
  itemindex:=pHDNotify(pHeader)^.Item;
  FillChar(iteminfo, sizeof(iteminfo), 0);

  iteminfo.Mask:=HDI_TEXT;
  iteminfo.pszText:=buf;
  iteminfo.cchTextMax:=sizeof(buf)-1;

  Header_GetItem(hwndHeader, itemindex, iteminfo);

  if CompareStr(ListView.Columns[itemindex].Caption, iteminfo.pszText)=0 then
    Result:=itemindex
  else
    for itemindex:=0 to ListView.Columns.count-1 do
      if CompareStr(ListView.Columns[itemindex].Caption, iteminfo.pszText)=0 then
        begin
          Result:=itemindex;
          Break;
        end;
end;

end.
