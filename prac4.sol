pragma solidity >=0.4.0<=0.6.0;
contract StudentRegister{
 address public owner;

 mapping (address=>student)students;
 constructor() public {
 owner=msg.sender;
 }

 modifier onlyOwner {
 require(msg.sender==owner);
 _;
 }
 struct student{

 address studentId;
 string name;
 string course;
 uint256 mark1;
 uint256 mark2;
 uint256 mark3;
 uint256 totalMarks;
 uint256 percentage;
 bool isExist;

 }
 function register(address studentId,string memory name,string memory course,uint256
mark1,uint256 mark2,uint256 mark3) public onlyOwner {
 require(students[studentId].isExist==false,"ha.. ha... Fraud Not Possible,student details
already registered and cannot be altered");

 uint256 totalMarks;
 uint256 percentage;


 totalMarks=(mark1+mark2+mark3);

 percentage=(totalMarks/3);


students[studentId]=student(studentId,name,course,mark1,mark2,mark3,totalMarks,percentage,tru
e);
 }


 function getStudentDetails(address studentId) public view returns (address,string memory,string
memory,uint256,uint256){


return(students[studentId].studentId,students[studentId].name,students[studentId].course,students
[studentId].totalMarks,students[studentId].percentage);
 }}


//fallback
pragma solidity ^0.4.0;
contract fback
{
uint x;
mapping(address => uint) balance;
constructor() public
{
x=10;
}
function SetX(uint _x) public returns(bool)
{
x=_x;
return true;
}
function() public payable
{
balance[msg.sender] += msg.value;
}
}
contract Sender
{
function transfer() public payable
{
address _receiver =
0xbcD310867F1b74142c2f5776404b6bd97165FA56;
_receiver.transfer(100);
}
}