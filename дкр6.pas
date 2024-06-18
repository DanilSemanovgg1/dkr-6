program static_dkr6;

const
maxSize = 100;

type
Node = record
data: integer;
prev, next: integer;
end;

var
nodeList: array[1..maxSize] of Node;
head, tail, freeIdx: integer;

procedure Initialize;
var
i: integer;
begin
head := 0;
tail := 0;
freeIdx := 1;

for i := 1 to maxSize do
begin
nodeList[i].prev := -1;
nodeList[i].next := -1;
end;
end;

procedure AddNode(data: integer);
begin
nodeList[freeIdx].data := data;
nodeList[freeIdx].prev := tail;
nodeList[freeIdx].next := 0;

if tail <> 0 then
nodeList[tail].next := freeIdx
else
head := freeIdx;

tail := freeIdx;

repeat
freeIdx := freeIdx + 1;
until (freeIdx > maxSize) or (nodeList[freeIdx].next = -1);
end;

procedure DisplayList;
var
current: integer;
begin
writeln('Двусвязный список:');
current := head;
while current <> 0 do
begin
write(nodeList[current].data, ' ');
current := nodeList[current].next;
end;
writeln;
end;
procedure DeleteNode(data: integer);
var
current, prevNode, nextNode: integer;
begin
current := head;
while current <> 0 do
begin
if nodeList[current].data = data then
begin
prevNode := nodeList[current].prev;
nextNode := nodeList[current].next;

if prevNode <> 0 then
nodeList[prevNode].next := nextNode
else
head := nextNode;

if nextNode <> 0 then
nodeList[nextNode].prev := prevNode
else
tail := prevNode;

nodeList[current].prev := -1;
nodeList[current].next := -1;
break;
end;

current := nodeList[current].next;
end;
end;

procedure Menu;
var
choice, data: integer;
begin
repeat
writeln('Меню:');
writeln('1. Добавить узел');
writeln('2. Отобразить список');
writeln('3. Выйти');
writeln('4. Delete');
write('Выбор за вами: ');
readln(choice);
case choice of
  1: begin
       write('Введите данные: ');
       readln(data);
       AddNode(data);
     end;
  2: DisplayList;
  3: writeln('До скорой встречи(');
  4: begin 
    write('///');
    readln(data);
    DeleteNode(data);
    
  end;
  else writeln('Подумай лучше)');
end;
until choice = 3;
end;

begin
Initialize;
Menu;
end.




