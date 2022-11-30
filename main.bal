type PersonDetails record {
    record {
        int id;
        string firstName;
        string lastName;
        int age;
    } person;
    record {
        string id;
        string name;
        int credits;
    }[] course;
};

type StudentDetails record {
    int id;
    string fullName;
    string age;
    record {
        string title;
        int credits;
    }[] courses;
    int totalCredits;
};

function transform(PersonDetails PersonDetails) 
    returns StudentDetails => {
    id: PersonDetails.person.id,
    fullName: PersonDetails.person.firstName 
            + " " + PersonDetails.person.lastName,
    age: PersonDetails.person.age.toString(),
    totalCredits: 0,
    courses: from var courseItem in PersonDetails.course
        select {
            title: courseItem.name,
            credits: courseItem.credits
        }
};
