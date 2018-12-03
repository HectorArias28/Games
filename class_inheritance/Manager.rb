require_relative "Employee"
class Manager < Employee

def initialize
    super
    @direct_reports = []
end

private

def bonus(multiplier)
    total = 0
    self.salary
    direct_reports.each {|employee| total += employee.salary }
    total * multiplier
end