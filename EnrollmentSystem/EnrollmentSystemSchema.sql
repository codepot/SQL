/*
	FINAL PROJECT
	Student Name: Phuc Le
*/

USE [master]
GO
/****** Object:  Database [FinalProject_PhucLe]    Script Date: 8/31/2015 5:03:45 PM ******/
CREATE DATABASE [FinalProject_PhucLe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProject_PhucLe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FinalProject_PhucLe.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FinalProject_PhucLe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FinalProject_PhucLe_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FinalProject_PhucLe] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProject_PhucLe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProject_PhucLe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProject_PhucLe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProject_PhucLe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProject_PhucLe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProject_PhucLe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProject_PhucLe] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProject_PhucLe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProject_PhucLe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProject_PhucLe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProject_PhucLe] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FinalProject_PhucLe] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FinalProject_PhucLe]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Department] [varchar](3) NOT NULL,
	[CourseNumber] [varchar](3) NOT NULL,
	[Title] [varchar](30) NULL,
	[Hours] [tinyint] NULL,
	[Standing] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Department] ASC,
	[CourseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Courses_Audit]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [varchar](3) NULL,
	[CourseNumber] [varchar](3) NULL,
	[Title] [varchar](30) NULL,
	[Hours] [tinyint] NULL,
	[Standing] [tinyint] NULL,
	[User] [varchar](25) NULL,
	[Operator] [varchar](6) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enrollments]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enrollments](
	[StudentID] [varchar](3) NOT NULL,
	[CallNumber] [numeric](5, 0) NOT NULL,
	[Grade] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Enrollments_Audit]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enrollments_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](3) NULL,
	[CallNumber] [numeric](5, 0) NULL,
	[Grade] [varchar](2) NULL,
	[User] [varchar](25) NULL,
	[Operator] [varchar](6) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Majors](
	[Major] [varchar](3) NOT NULL,
	[Description] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Majors_Audit]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Majors_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[Major] [varchar](3) NULL,
	[Description] [varchar](30) NULL,
	[User] [varchar](25) NULL,
	[Operator] [varchar](6) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prerequisites]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prerequisites](
	[Department] [varchar](3) NOT NULL,
	[CourseNumber] [varchar](3) NOT NULL,
	[prereq_Department] [varchar](3) NOT NULL,
	[prereq_CourseNumber] [varchar](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Department] ASC,
	[CourseNumber] ASC,
	[prereq_Department] ASC,
	[prereq_CourseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prerequisites_Audit]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Prerequisites_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[Department] [varchar](3) NULL,
	[CourseNumber] [varchar](3) NULL,
	[prereq_Department] [varchar](3) NULL,
	[prereq_CourseNumber] [varchar](3) NULL,
	[User] [varchar](25) NULL,
	[Operator] [varchar](6) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduledClasses]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduledClasses](
	[CallNumber] [numeric](5, 0) NOT NULL,
	[Year] [numeric](4, 0) NOT NULL,
	[Semester] [varchar](3) NOT NULL,
	[Department] [varchar](3) NOT NULL,
	[CourseNumber] [varchar](3) NOT NULL,
	[Section] [tinyint] NULL,
	[Capacity] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[CallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScheduledClasses_Audit]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ScheduledClasses_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[CallNumber] [numeric](5, 0) NULL,
	[Year] [numeric](4, 0) NULL,
	[Semester] [varchar](3) NULL,
	[Department] [varchar](3) NULL,
	[CourseNumber] [varchar](3) NULL,
	[Section] [tinyint] NULL,
	[Capacity] [smallint] NULL,
	[User] [varchar](25) NULL,
	[Operator] [varchar](6) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [varchar](3) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Standing] [tinyint] NULL,
	[Major] [varchar](3) NULL,
	[gpa] [decimal](2, 1) NULL,
	[major_gpa] [decimal](2, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students_Audit]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](3) NULL,
	[Name] [varchar](10) NULL,
	[Standing] [tinyint] NULL,
	[Major] [varchar](3) NULL,
	[gpa] [decimal](2, 1) NULL,
	[major_gpa] [decimal](2, 1) NULL,
	[User] [varchar](25) NULL,
	[Operator] [varchar](6) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Waitlist]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Waitlist](
	[StudentID] [varchar](3) NOT NULL,
	[CallNumber] [numeric](5, 0) NOT NULL,
	[RequestTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Waitlist_Audit]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Waitlist_Audit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](3) NULL,
	[CallNumber] [numeric](5, 0) NULL,
	[RequestTime] [datetime] NULL,
	[User] [varchar](25) NULL,
	[Operator] [varchar](6) NULL,
	[DateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fnCountStudentHasAtLeastGPAGroupByMajors]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCountStudentHasAtLeastGPAGroupByMajors]
(@gpa Decimal(2,1)) RETURNS TABLE
RETURN
(SELECT Majors.Description AS MAJOR, COUNT (StudentID) as [NUMBER OF STUDENTS] FROM Students INNER JOIN Majors
ON Students.Major = Majors.Major
WHERE gpa >= @gpa
GROUP BY (Majors.Description) HAVING (Majors.Description IS NOT NULL AND Majors.Description != 'To be described')); -- declared major students only



GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [Courses_idx]    Script Date: 8/31/2015 5:03:45 PM ******/
CREATE NONCLUSTERED INDEX [Courses_idx] ON [dbo].[Courses]
(
	[Department] ASC,
	[CourseNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [majors_idx]    Script Date: 8/31/2015 5:03:45 PM ******/
CREATE NONCLUSTERED INDEX [majors_idx] ON [dbo].[Majors]
(
	[Major] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ScheduledClasses_idx]    Script Date: 8/31/2015 5:03:45 PM ******/
CREATE NONCLUSTERED INDEX [ScheduledClasses_idx] ON [dbo].[ScheduledClasses]
(
	[CallNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [students_idx]    Script Date: 8/31/2015 5:03:45 PM ******/
CREATE NONCLUSTERED INDEX [students_idx] ON [dbo].[Students]
(
	[StudentID] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((1)) FOR [Hours]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((1)) FOR [Standing]
GO
ALTER TABLE [dbo].[Majors] ADD  DEFAULT ('To be described') FOR [Description]
GO
ALTER TABLE [dbo].[ScheduledClasses] ADD  DEFAULT ((1)) FOR [Section]
GO
ALTER TABLE [dbo].[ScheduledClasses] ADD  DEFAULT ((15)) FOR [Capacity]
GO
ALTER TABLE [dbo].[Students] ADD  DEFAULT ((0.0)) FOR [gpa]
GO
ALTER TABLE [dbo].[Waitlist] ADD  CONSTRAINT [DF_Waitlist]  DEFAULT (getdate()) FOR [RequestTime]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [fk_courses_dept] FOREIGN KEY([Department])
REFERENCES [dbo].[Majors] ([Major])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [fk_courses_dept]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [fk_enrollments_callnum] FOREIGN KEY([CallNumber])
REFERENCES [dbo].[ScheduledClasses] ([CallNumber])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [fk_enrollments_callnum]
GO
ALTER TABLE [dbo].[Enrollments]  WITH CHECK ADD  CONSTRAINT [fk_enrollments_snum] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Enrollments] CHECK CONSTRAINT [fk_enrollments_snum]
GO
ALTER TABLE [dbo].[Prerequisites]  WITH CHECK ADD  CONSTRAINT [fk_prereq_dept_cnum] FOREIGN KEY([Department], [CourseNumber])
REFERENCES [dbo].[Courses] ([Department], [CourseNumber])
GO
ALTER TABLE [dbo].[Prerequisites] CHECK CONSTRAINT [fk_prereq_dept_cnum]
GO
ALTER TABLE [dbo].[Prerequisites]  WITH CHECK ADD  CONSTRAINT [fk_prereq_pdept_pcnum] FOREIGN KEY([prereq_Department], [prereq_CourseNumber])
REFERENCES [dbo].[Courses] ([Department], [CourseNumber])
GO
ALTER TABLE [dbo].[Prerequisites] CHECK CONSTRAINT [fk_prereq_pdept_pcnum]
GO
ALTER TABLE [dbo].[ScheduledClasses]  WITH CHECK ADD  CONSTRAINT [fk_schclasses_dept_cnum] FOREIGN KEY([Department], [CourseNumber])
REFERENCES [dbo].[Courses] ([Department], [CourseNumber])
GO
ALTER TABLE [dbo].[ScheduledClasses] CHECK CONSTRAINT [fk_schclasses_dept_cnum]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [fk_students_major] FOREIGN KEY([Major])
REFERENCES [dbo].[Majors] ([Major])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [fk_students_major]
GO
ALTER TABLE [dbo].[Waitlist]  WITH CHECK ADD  CONSTRAINT [fk_waitlist_callnum] FOREIGN KEY([CallNumber])
REFERENCES [dbo].[ScheduledClasses] ([CallNumber])
GO
ALTER TABLE [dbo].[Waitlist] CHECK CONSTRAINT [fk_waitlist_callnum]
GO
ALTER TABLE [dbo].[Waitlist]  WITH CHECK ADD  CONSTRAINT [fk_waitlist_snum] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[Waitlist] CHECK CONSTRAINT [fk_waitlist_snum]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteCourse]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_DeleteCourse]
        @Department Varchar(3),
	    @CourseNumber Varchar(3)      
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Courses  WHERE Department = @Department AND CourseNumber= @CourseNumber) 	
		PRINT 'Course: ' + CONVERT(varchar, @Department) + CONVERT(varchar, @CourseNumber) + ' does not exist.';
	ELSE	
		BEGIN
			IF (EXISTS (Select * FROM ScheduledClasses WHERE Department  = @Department AND CourseNumber = @CourseNumber) OR 
				EXISTS (SELECT * from ScheduledClasses s, Enrollments e WHERE  s.CallNumber = e.CallNumber and Department = @Department and CourseNumber=@CourseNumber) OR
				EXISTS (SELECT * from ScheduledClasses s, Waitlist  w WHERE  s.CallNumber = w.CallNumber and Department = @Department and CourseNumber=@CourseNumber))
				PRINT 'Course: ' + CONVERT(varchar, @Department) + CONVERT(varchar, @CourseNumber) + ' can not be deleted due to referential integrity (this student has enrolled or has been in waitlist';
			ELSE
				DELETE FROM Courses WHERE Department = @Department AND CourseNumber= @CourseNumber;
		END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteEnrollment]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteEnrollment]
  @StudentID Varchar(3),   
  @CallNumber Numeric (5,0)  
AS
BEGIN
IF EXISTS (SELECT * FROM Students  WHERE StudentID = @StudentID)					
	IF EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber)	
		IF EXISTS (SELECT * FROM Enrollments  WHERE StudentID = @StudentID AND CallNumber = @CallNumber) 
			IF EXISTS (SELECT * FROM Enrollments  WHERE StudentID = @StudentID AND CallNumber = @CallNumber AND Grade IS NULL) 
				DELETE FROM Enrollments WHERE StudentID = @StudentID AND CallNumber = @CallNumber;
			ELSE
				PRINT 'Can not delete this enrollment because grade was assigned';
		ELSE
			PRINT 'Student ' + @StudentID + ' has not enrolled ' + CONVERT(varchar, @CallNumber) + ' before';					
							
	ELSE
		THROW 50001, 'Invalid Scheduled Course call number', 1;	
ELSE
	THROW 50001, 'Invalid Student', 1;	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMajor]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteMajor]
       @Major Varchar(3)        
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Majors WHERE Major = @Major) 	
	PRINT CONVERT(varchar, @Major) + ' is not found.';
ELSE	
	BEGIN
		IF (EXISTS (Select * FROM Students WHERE Major = @Major) AND 
			EXISTS (Select * FROM Courses WHERE Department  = @Major))
			PRINT CONVERT(varchar, @Major) + ' can not be deleted due to referential integrity';
		ELSE
			DELETE FROM Majors WHERE Major = @Major;	
	END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePrerequisite]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeletePrerequisite]
  @Department Varchar(3),
  @CourseNumber Varchar(3),
  @prereq_Department Varchar(3),
  @prereq_CourseNumber Varchar(3)       
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Prerequisites  WHERE Department = @Department AND CourseNumber= @CourseNumber AND prereq_Department = @prereq_Department AND prereq_CourseNumber = @prereq_CourseNumber) 	
	PRINT 'This Prerequisite is not found.';
ELSE	
	DELETE FROM Prerequisites WHERE Department = @Department AND CourseNumber= @CourseNumber AND prereq_Department = @prereq_Department AND prereq_CourseNumber = @prereq_CourseNumber;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteScheduledClass]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteScheduledClass]
       @CallNumber Numeric      
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber) 	
		PRINT 'Call Number: ' + CONVERT(varchar, @CallNumber) + ' does not exist.';
	ELSE	
		BEGIN
			IF (
				EXISTS (SELECT * from Enrollments WHERE CallNumber = @CallNumber) OR
				EXISTS (SELECT * from Waitlist WHERE CallNumber = @CallNumber))
				PRINT 'Call Number: ' + CONVERT(varchar, @CallNumber) + ' can not be deleted due to referential integrity (this student has enrolled or has been in waitlist';
			ELSE
				DELETE FROM ScheduledClasses WHERE CallNumber = @CallNumber;
		END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteStudent]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteStudent]
       @StudentID Varchar(3)        
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Students WHERE StudentID = @StudentID) 	
		PRINT CONVERT(Varchar, @StudentID) + ' is not found.';
	ELSE	
		BEGIN
			IF (EXISTS (Select * FROM Enrollments WHERE StudentID = @StudentID) OR 
				EXISTS (Select * FROM Waitlist  WHERE StudentID = @StudentID))
				PRINT 'StudentID ' + CONVERT(varchar, @StudentID) + ' can not be deleted due to referential integrity';
			ELSE
				DELETE FROM Students WHERE StudentID = @StudentID;
		END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteWaitlistRecord]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_DeleteWaitlistRecord]
  @StudentID Varchar(3),   
  @CallNumber Numeric (5,0)  
AS
BEGIN
IF EXISTS (SELECT * FROM Students  WHERE StudentID = @StudentID)					
	IF EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber)	
		IF EXISTS (SELECT * FROM Waitlist  WHERE StudentID = @StudentID AND CallNumber = @CallNumber)			
				DELETE FROM Waitlist WHERE StudentID = @StudentID AND CallNumber = @CallNumber;			
		ELSE
			PRINT 'Student ' + @StudentID + ' has not been in waitlist for course ' + CONVERT(varchar, @CallNumber) + ' before';					
							
	ELSE
		THROW 50001, 'Invalid Scheduled Course call number', 1;	
ELSE
	THROW 50001, 'Invalid Student', 1;	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCourse]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertCourse]
  @Department Varchar(3),
  @CourseNumber Varchar(3),
  @Title Varchar(30),
  @Hours Tinyint,
  @Standing Tinyint     
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Courses  WHERE Department = @Department AND CourseNumber= @CourseNumber) 
	BEGIN
		IF @Department IS NULL OR @CourseNumber IS NULL OR @Title IS NULL OR @Hours IS NULL OR @Standing IS NULL
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF  EXISTS (SELECT * FROM Majors WHERE Major = @Department)
				INSERT INTO Courses (Department, CourseNumber, Title, Hours, Standing) VALUES (@Department, @CourseNumber, @Title, @Hours, @Standing);
			   ELSE
				THROW 50001, 'Invalid Major', 1;
			END
	END
ELSE
	PRINT 'Course: ' + CONVERT(varchar, @Department) + CONVERT(varchar, @CourseNumber)+ ' already existed.';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEnrollment]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- create a ScheduledClass
CREATE PROC [dbo].[sp_InsertEnrollment]
  @StudentID Varchar(3),   
  @CallNumber Numeric (5,0) 
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Enrollments  WHERE StudentID = @StudentID AND CallNumber = @CallNumber) 
	BEGIN
		IF @CallNumber IS NULL OR @StudentID IS NULL 
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF EXISTS (SELECT * FROM Students  WHERE StudentID = @StudentID)					
							IF EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber)					
							INSERT INTO Enrollments(StudentID, CallNumber) VALUES (@StudentID, @CallNumber);
						ELSE
							THROW 50001, 'Invalid Scheduled Course call number', 1;	
				ELSE
					THROW 50001, 'Invalid Student', 1;			  
			END
	END	
ELSE
	PRINT 'Student ' + @StudentID + 'has enroll ' + CONVERT(varchar, @CallNumber) + ' before';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertMajor]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertMajor]
       @Major   Varchar(3), 
       @Description Varchar(30)      
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Majors WHERE Major = @Major) 
	BEGIN
		IF @Major IS NULL
			THROW 50001, 'Invalid Major', 1;
		ELSE
			BEGIN
				IF @Description IS NOT NULL
					INSERT INTO Majors (Major, Description) VALUES ( @Major, @Description);
				ELSE -- Description picks up default value
					INSERT INTO Majors (Major) VALUES ( @Major);
			END
	END
ELSE
	PRINT CONVERT(varchar, @Major) + ' already existed.';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPrerequisite]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- create a course prerequisite
CREATE PROC [dbo].[sp_InsertPrerequisite]
  @Department Varchar(3),
  @CourseNumber Varchar(3),
  @prereq_Department Varchar(3),
  @prereq_CourseNumber Varchar(3)  
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Prerequisites  WHERE Department = @Department AND CourseNumber= @CourseNumber AND prereq_Department = @prereq_Department AND prereq_CourseNumber = @prereq_CourseNumber) 
	BEGIN
		IF  EXISTS (SELECT * FROM Courses  WHERE Department = @Department AND CourseNumber= @CourseNumber) 
			BEGIN
				IF  EXISTS (SELECT * FROM Courses  WHERE Department = @prereq_Department AND CourseNumber= @prereq_CourseNumber) 
					BEGIN
						IF (CONVERT(INT, @CourseNumber) > CONVERT(INT, @prereq_CourseNumber))
							
								INSERT INTO Prerequisites(Department, CourseNumber, prereq_Department, prereq_CourseNumber) VALUES (@Department, @CourseNumber, @prereq_Department, @prereq_CourseNumber);
						
						ELSE
							PRINT '@CourseNumber must greater than @prereq_CourseNumber';
					END
				ELSE
					THROW 50001, 'Invalid @prereq_Department and @prereq_CourseNumber', 1;
			END
		ELSE			
			THROW 50001, 'Invalid @Department and @CourseNumber', 1;
	END
ELSE
	PRINT 'This Prerequisite already existed.';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertScheduledClass]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- create a ScheduledClass
CREATE PROC [dbo].[sp_InsertScheduledClass]
  @CallNumber Numeric (5,0),
  @Year Numeric (4,0),
  @Semester Varchar(3),
  @Department Varchar(3),
  @CourseNumber Varchar(3),
  @Section tinyint,
  @Capacity smallint    
AS
BEGIN
IF NOT EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber) 
	BEGIN
		IF @CallNumber IS NULL OR @Year IS NULL OR @Semester IS NULL OR @Department IS NULL OR @CourseNumber IS NULL OR @Section IS NULL OR @Capacity IS NULL
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF EXISTS (SELECT * FROM Courses  WHERE Department = @Department AND CourseNumber= @CourseNumber)					
					INSERT INTO ScheduledClasses( CallNumber, Year, Semester, Department, CourseNumber, Section, Capacity) VALUES (@CallNumber, @Year, @Semester, @Department, @CourseNumber, @Section, @Capacity) ;
				ELSE
					THROW 50001, 'Invalid Course', 1;			  
			END
	END	
ELSE
	PRINT 'Call Number ' + CONVERT(varchar, @CallNumber) + ' was already scheduled';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertStudent]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertStudent]
       @StudentID   Varchar(3), 
       @Name Varchar(10),
	   @Standing Tinyint,
	   @Major Varchar(3),
	   @gpa Decimal (2,1),
	   @major_gpa Decimal(2,1)      
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Students WHERE StudentID = @StudentID) 
	BEGIN
		IF @Name IS NULL
			THROW 50001, 'Invalid Name', 1;
		ELSE
			BEGIN
			   IF  EXISTS (SELECT * FROM Majors WHERE Major = @Major)  OR @Major IS NULL
			    INSERT INTO Students (StudentID, Name, Standing, Major, gpa, major_gpa) 
				VALUES (@StudentID, @Name, @Standing, @Major, @gpa, @major_gpa);
			   ELSE
				THROW 50001, 'Invalid Major', 1;
			END
	END
ELSE
	PRINT 'Student ID: ' + CONVERT(varchar, @StudentID) + ' already existed.';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertWaitlistRecord]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_InsertWaitlistRecord]
  @StudentID Varchar(3),   
  @CallNumber Numeric (5,0) 
AS
BEGIN
IF NOT EXISTS (SELECT * FROM Waitlist WHERE StudentID = @StudentID AND CallNumber = @CallNumber) 
	BEGIN
		IF @CallNumber IS NULL OR @StudentID IS NULL 
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF EXISTS (SELECT * FROM Students  WHERE StudentID = @StudentID)					
							IF EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber)					
							INSERT INTO Waitlist(StudentID, CallNumber) VALUES (@StudentID, @CallNumber);
						ELSE
							THROW 50001, 'Invalid Scheduled Course call number', 1;	
				ELSE
					THROW 50001, 'Invalid Student', 1;			  
			END
	END	
ELSE
	PRINT 'Student ' + @StudentID + 'has been in Waitlist for course ' + CONVERT(varchar, @CallNumber) + ' before';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateCourse]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateCourse]
      @Department Varchar(3),
	  @CourseNumber Varchar(3),
	  @Title Varchar(30),
	  @Hours Tinyint,
	  @Standing Tinyint         
AS
BEGIN
IF EXISTS (SELECT * FROM Courses  WHERE Department = @Department AND CourseNumber= @CourseNumber)  	
	BEGIN
		IF @Department IS NULL OR @CourseNumber IS NULL OR @Title IS NULL OR @Hours IS NULL OR @Standing IS NULL
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF  EXISTS (SELECT * FROM Majors WHERE Major = @Department)
				UPDATE Courses SET Title = @Title, Hours= @Hours, Standing=@Standing WHERE Department = @Department AND CourseNumber = @CourseNumber;
			   ELSE
				THROW 50001, 'Invalid Major', 1;
			END		
	END
ELSE
	PRINT 'Course: ' + CONVERT(varchar, @Department) + CONVERT(varchar, @CourseNumber) + ' does not exist.';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateEnrollment]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateEnrollment]
        @StudentID Varchar(3),   
		@CallNumber Numeric (5,0),
		@Grade Varchar(2)     
AS
BEGIN
	IF @CallNumber IS NULL OR @StudentID IS NULL 
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF EXISTS (SELECT * FROM Students  WHERE StudentID = @StudentID)					
							IF EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber)	
								IF EXISTS (SELECT * FROM Enrollments  WHERE StudentID = @StudentID AND CallNumber = @CallNumber) 
									UPDATE Enrollments SET Grade = @Grade WHERE StudentID = @StudentID AND CallNumber = @CallNumber;
								ELSE
									PRINT 'Student ' + @StudentID + ' has not enrolled ' + CONVERT(varchar, @CallNumber) + ' before';					
							
						ELSE
							THROW 50001, 'Invalid Scheduled Course call number', 1;	
				ELSE
					THROW 50001, 'Invalid Student', 1;			  
			END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMajor]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateMajor]
       @Major   Varchar(3), 
       @Description Varchar(30)      
AS
BEGIN
IF EXISTS (SELECT * FROM Majors WHERE Major = @Major) 	
	BEGIN
		IF @Description IS NOT NULL
			UPDATE Majors SET Description = @Description WHERE Major = @Major;
		ELSE -- Description picks up default value
			UPDATE Majors SET Description = 'To be described' WHERE Major = @Major;			
	END
ELSE
	PRINT CONVERT(varchar, @Major) + ' does not exist.';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateScheduledClass]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateScheduledClass]
	  @CallNumber Numeric (5,0),
	  @Year Numeric (4,0),
	  @Semester Varchar(3),
	  @Department Varchar(3),
	  @CourseNumber Varchar(3),
	  @Section tinyint,
	  @Capacity smallint         
AS
BEGIN
IF EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber)  	
	BEGIN
		IF @CallNumber IS NULL OR @Year IS NULL OR @Semester IS NULL OR @Department IS NULL OR @CourseNumber IS NULL OR @Section IS NULL OR @Capacity IS NULL
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF EXISTS (SELECT * FROM Courses  WHERE Department = @Department AND CourseNumber= @CourseNumber)					
					UPDATE ScheduledClasses SET Year = @Year, Semester = @Semester, Department = @Department, CourseNumber = @CourseNumber, Section = @Section, Capacity = @Capacity WHERE CallNumber = @CallNumber
				ELSE
					THROW 50001, 'Invalid Course', 1;			  
			END	
	END
ELSE
	PRINT 'Call Number ' + CONVERT(varchar, @CallNumber) + ' does not exist';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateStudent]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateStudent]
       @StudentID   Varchar(3), 
       @Name Varchar(10),
	   @Standing Tinyint,
	   @Major Varchar(3),
	   @gpa Decimal (2,1),
	   @major_gpa Decimal(2,1)      
AS
BEGIN
IF EXISTS (SELECT * FROM Students WHERE StudentID = @StudentID) 	
	BEGIN
		IF @Name IS NOT NULL
			IF  EXISTS (SELECT * FROM Majors WHERE Major = @Major)  OR  @Major IS NULL
			     UPDATE Students SET 
					Name = @Name, Standing = @Standing, Major = @Major, gpa = @gpa, major_gpa = @major_gpa WHERE StudentID = @StudentID;	  
			ELSE
				THROW 50001, 'Invalid Major', 1;
		ELSE 
			PRINT 'Student Name ' + CONVERT(varchar, @StudentID) + ' can not be null';			
	END
ELSE
	PRINT 'Student ID ' + CONVERT(varchar, @StudentID) + ' does not exist.';
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateWaitlistRecord]    Script Date: 8/31/2015 5:03:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_UpdateWaitlistRecord]
        @StudentID Varchar(3),   
		@CallNumber Numeric (5,0)		 
AS
BEGIN
	IF @CallNumber IS NULL OR @StudentID IS NULL 
			THROW 50001, 'All field value must not be null', 1;
		ELSE
			BEGIN
			   IF EXISTS (SELECT * FROM Students  WHERE StudentID = @StudentID)					
							IF EXISTS (SELECT * FROM ScheduledClasses  WHERE CallNumber = @CallNumber)	
								IF EXISTS (SELECT * FROM Waitlist  WHERE StudentID = @StudentID AND CallNumber = @CallNumber) 
									UPDATE Waitlist SET RequestTime = GETDATE() WHERE StudentID = @StudentID AND CallNumber = @CallNumber;
								ELSE
									PRINT 'Student ' + @StudentID + ' has not been in waitlist for course ' + CONVERT(varchar, @CallNumber) + ' before';					
							
						ELSE
							THROW 50001, 'Invalid Scheduled Course call number', 1;	
				ELSE
					THROW 50001, 'Invalid Student', 1;			  
			END
END	

GO
USE [master]
GO
ALTER DATABASE [FinalProject_PhucLe] SET  READ_WRITE 
GO
