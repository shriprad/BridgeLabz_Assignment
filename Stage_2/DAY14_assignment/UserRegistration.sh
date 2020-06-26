
#!/bin/bash

shopt -s extglob

regUser="^[A-Z]{1}[a-z.]{2,30}$"
regMail="^[A-Za-z_.+-]{3,}@[A-Za-z]{3,}[.]{1}[A-Za-z.]{2,6}$"
regMob="^[789][0-9]{9}$"
regPass="^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&-+=()])(?=\\S+$).{8, 20}$"
echo "Please Enter your First Name"
read first_name

if [[ $first_name =~ $regUser ]] ; then
    echo "Please enter valid first name"
    echo "Enter Last name"
    read last_name
    if [[ $last_name =~ $regUser ]] ; then
      echo "Please enter your email id"
      echo "Enter email-id"
      read email_id

      if [[ $email_id =~ $regMail ]] ; then
        echo "Please enter your phone number"
        read phone_no
        if [[ $phone_no =~ $regMob ]] ; then
          echo "Please enter your password"
          read pass

          if [[ $pass =~ $regPass ]] ; then
            echo "Your registration has been completed"
          else
            echo "Please enter valid password"

          fi


        else
          echo "Please enter valid number"

        fi




      else
        echo "Please enter valid email id"

      fi



    else
      echo "First name starts with caps and should not contain any numbers of special characters and mi"
    fi

else
    echo "First name starts with caps and should not contain any numbers of special characters and minimum 3 characters"
fi
