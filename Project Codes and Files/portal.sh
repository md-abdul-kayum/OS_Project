clear
figlet -f digital "Welcome to GUB Portal" -c | lolcat
echo "1.Log In"
echo "2.About"
echo "3.Exit"
teacher() {
clear 
echo "1.View the database"
echo "2.View Specific Records"
echo "3.Add Result "
echo "4.Delete Result"
echo "5.View Evaluation"
echo "6.Log Out" 
echo "Enter Your Choise:"
read choise
case $choise in 

1)cat $db
echo "Do you want to continue? "
read i 
if [ $i == "yes" ]
then 
clear 
figlet -f digital "GUB Portal" -c | lolcat
teacher
fi;;

2)echo "Enter Student Id: "
read id 
grep -i "$id" $db
echo "Do you want to continue?"
read i 
if [ $i == "yes" ]
then 
clear 
figlet -f digital "GUB Portal" -c | lolcat
teacher 
fi;;

3)echo "Enter Student id : "
read sid
echo "Enter Name : "
read snm
echo "Enter Semester: "
read semester
echo "Total number of courses: "
read num
for ((i=1; i<=num; i++))
do
read -p "Enter course-$i: " course[i]
done

for ((j=1; j<=num; j++))
do
read -p "Enter Result of course-$j: " result[j]
done
echo -e "Student ID: $sid  Student Name: $snm  Result of the semester: $semester  Total corurse completed: $num  Name of the coueses: ${course[@]}  Result of the courses: ${result[@]}">>$db
#echo -e "Student ID: $sid  Student Name: $snm  Result of the semester: $semester  Total corurse completed: $num  ${course[@]}  ${result[@]}">>$db
#echo -e "$sid  $snm  $semester $num  ${course[@]}  ${result[@]}">>$db
echo "Do you want to continue?"
read i 
if [ $i == "yes" ]
then 
clear
figlet -f digital "GUB Portal" -c | lolcat
teacher
fi;;

4)echo "Enter Id: "
read id 
grep -v "$id " $db > tmpfile && mv tmpfile $db
echo "Record Deleted. "
cat $db
echo "Do you want to continue?"
read i
if [ $i == "yes" ] 
then 
clear 
figlet -f digital "GUB Portal" -c | lolcat
teacher
fi;;

5)echo "Enter Teacher Name: "
read t_name 
grep -i "$t_name" $db
echo "Do you want to continue?"
read i 
if [ $i == "yes" ]
then 
clear 
figlet -f digital "GUB Portal" -c | lolcat
teacher 
fi;;
esac
}

student(){
echo "1.View Result"
echo "2.Teacher Evaluation"
echo "3.Pre-Resistration"
echo "4.View Pre-Resistration"
echo "5.Log Out"
read choise
case $choise in 

1)echo "Enter Student Id: "
read id 
grep -i "$id" $db
echo "Do you want to continue?"
read i 
if [ $i == "yes" ]
then 
clear 
figlet -f digital "GUB Portal" -c | lolcat
student 
fi;;

2)echo "Enter Teacher Name: "
read t_name
echo "Enter Section: "
read sec
echo "Enter Comments: "
read comments
echo "Enter Institution Name "
read sins
echo "$t_name \t Institution Name: $sins \t Course Section: $sec \t Comments: $comments">>$db
echo "Do you want to continue?"
read i 
if [ $i == "yes" ]
then 
clear
figlet -f digital "GUB Portal" -c | lolcat
student
fi;;

3)echo "Enter your student id : "
read sid
echo "Enter Name : "
read snm
echo "Enter Section: "
read section
echo "How many course you want to take: "
read num
for ((i=1; i<=num; i++))
do
read -p "Enter course-$i: " course[i]
done
echo -e "Student Id: $sid \t Total Course Taken: $num \t Selected section: $section \t Selected courses: ${course[@]} ">>$db_student.txt
echo "Do you want to continue?"
read i 
if [ $i == "yes" ]
then 
clear
figlet -f digital "GUB Portal" -c | lolcat
student
fi;;

4)echo "Enter Your ID: "
read id 
grep -i "$id" $db_student.txt
echo "Do you want to continue?"
read i 
if [ $i == "yes" ]
then 
clear 
figlet -f digital "GUB Portal" -c | lolcat
student 
fi;;
esac
}

echo "Choose the option between 1/2/3"
read choose 
if [ $choose -eq 1 ];
then
figlet -f slant "Log In" -c | lolcat
echo "a.Student Log In"
echo "b.Teachers Log In"
echo "Your choice between a/b"
read cho
if [ $cho == "a" ];
then
echo "Enter Student ID:"
read id 
echo "Enter Password : "
read pass
 if [ $id == "201002334" ] && [ $pass == "kaiyum" ];
 then 
 echo "Login Success! "
 echo "Enter name of database :"
 read db 
 student 
 else 
 echo "Login Failed! "
 fi
 fi
  
if [ $cho == "b" ];
then
echo "Enter username:"
read user 
echo "Enter Password : "
read password
 if [ $user == "polash" ] && [ $password == "12345" ];
 then 
 echo "Login Success! "
 echo "Enter name of database :"
 read db 
 teacher 
 else 
 echo "Login Failed! "
 fi 
 fi
 elif [ $choose -eq 2 ];
 then 
 figlet -f digital "Project By Md.Abdul Kaiyum" -c | lolcat
 else 
 exit 
 fi
