FactoryGirl.define do
  factory :person, class: OpenStruct do
    name            "Test"
    email           "test@gmail.com"
    email_hash      "6d2661c5a65f24c8f0bb579b6e0a0d81"
    group           "Visitor"
    website         nil
    membership_date nil
    github_uid      "1234"
    github_nickname "github_nickname"
    permissions     Hash[[["Clubhouse", "Administrator"],
                          ["Community", "Administrator"],
                          ["Liskov",    "Administrator"]]]
  end

  factory :instructor, parent: "person" do
    github_nickname "instructor"
    course_membership {
      FactoryGirl.create(:course_membership, course: course,
                          person_github_nickname: "#{github_nickname}",
                          role: "Instructor") if course
    }
  end

  factory :student, parent: "person" do
    github_nickname "student"
    course_membership {
      FactoryGirl.create(:course_membership, course: course,
                          person_github_nickname: "#{github_nickname}",
                          role: "Student") if course
    }
  end
end