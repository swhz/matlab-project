score=input('请输入卷面成绩：score=');
switch fix(score/10)
    case 9
        grade='优'
    case 8
        grade='良'
    case 7
        grade='中'
    case 6
        grade='及格'
    otherwise
        grade='不及格'
end
