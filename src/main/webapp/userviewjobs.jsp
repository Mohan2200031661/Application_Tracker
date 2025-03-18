<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="com.mb.project.model.JobLink"%>
<%@ page import="java.util.List"%>

<%
List<JobLink> jl = (List<JobLink>) request.getAttribute("jl");
DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

if (jl != null) {
	// Sorting jobs based on deadline (earliest first)
	Collections.sort(jl, Comparator.comparing(JobLink::getClosingDateTime));
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>View Job Applications</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

body {
    font-family: 'Poppins', sans-serif;
    text-align: center;
    margin: 0;
    padding: 0;
    background: #f8f9fa;
}

.container {
    max-width: 1200px;
    margin: 30px auto;
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

h2 {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 15px;
}

.count-box {
    font-size: 18px;
    font-weight: 500;
    color: #333;
}

.filter-buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-bottom: 25px;
    flex-wrap: wrap;
}

.filter-btn {
    background: #007bff;
    color: white;
    padding: 12px 18px;
    border: none;
    cursor: pointer;
    border-radius: 6px;
    font-size: 16px;
    font-weight: 500;
    transition: 0.3s;
}

.filter-btn:hover, .filter-btn.active {
    background: #0056b3;
}

.job-list {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    padding: 10px;
}

.job-card {
    width: 320px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    padding: 20px;
    text-align: left;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.job-card:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
}

.job-title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #333;
}

.job-desc {
    font-size: 14px;
    color: #666;
    margin-bottom: 12px;
}

.countdown {
    font-size: 14px;
    font-weight: bold;
    margin-top: 10px;
}

.apply-btn {
    color: white;
    padding: 12px;
    border: none;
    cursor: pointer;
    border-radius: 6px;
    font-size: 16px;
    text-align: center;
    text-decoration: none;
    margin-top: 12px;
    display: block;
    transition: background 0.3s ease;
    text-transform: uppercase;
    font-weight: 600;
}

.apply-btn:hover {
    opacity: 0.9;
}

.apply-btn[disabled], .apply-btn.disabled {
    background: gray !important;
    cursor: not-allowed;
}

.hidden {
    display: none !important;
}

/* Responsive Design */
@media (max-width: 768px) {
    .filter-buttons {
        flex-direction: column;
        gap: 10px;
    }
    .job-list {
        flex-direction: column;
        align-items: center;
    }
    .job-card {
        width: 90%;
    }
}

@media (max-width: 480px) {
    .container {
        padding: 15px;
    }
    .job-card {
        width: 100%;
    }
}
</style>
<script>
        function showJobs(category) {
            document.querySelectorAll('.job-list').forEach(el => el.classList.add('hidden'));
            document.getElementById(category).classList.remove('hidden');

            document.querySelectorAll('.filter-btn').forEach(el => el.classList.remove('active'));
            document.querySelector(`[data-category="${category}"]`).classList.add('active');
        }
    </script>
</head>
<body>
	<jsp:include page="usernavbar.jsp" />
	<br />
	<div class="container">
		<h2>Job Listings</h2>
		<h3 align="center">
			<span class="count-box">Total Count: ${count}</span>
		</h3>

		<!-- Filter Buttons -->
		<div class="filter-buttons">
			<button class="filter-btn active" data-category="all-jobs"
				onclick="showJobs('all-jobs')">All Jobs</button>
			<button class="filter-btn" data-category="closing-today"
				onclick="showJobs('closing-today')">Closing Today</button>
			<button class="filter-btn" data-category="open-applications"
				onclick="showJobs('open-applications')">Open Applications</button>
			<button class="filter-btn" data-category="closed-applications"
				onclick="showJobs('closed-applications')">Closed
				Applications</button>
		</div>

		<!-- All Jobs (Excluding Closed Applications) -->
		<div id="all-jobs" class="job-list">
			<%
			LocalDateTime now = LocalDateTime.now();
			for (JobLink job : jl) {
				if (job.getClosingDateTime().isAfter(now)) {
			%>
			<div class="job-card">
				<div class="job-title"><%=job.getCompanyName()%></div>
				<div class="job-desc"><%=job.getJobDescription()%></div>
				<div class="countdown" style="color: green;">
					Closing on
					<%=job.getClosingDateTime().format(formatter)%></div>
				<a href="<%=job.getApplicationLink()%>" target="_blank"
					class="apply-btn" style="background: #007bff;">Apply Now</a>
			</div>
			<%
			}
			}
			%>
		</div>

		<!-- Applications Closing Today -->
		<div id="closing-today" class="job-list hidden">
			<%
			for (JobLink job : jl) {
				LocalDateTime closingTime = job.getClosingDateTime();
				long minutesLeft = java.time.Duration.between(now, closingTime).toMinutes();
				if (minutesLeft > 0 && minutesLeft <= 1440) {
			%>
			<div class="job-card">
				<div class="job-title"><%=job.getCompanyName()%></div>
				<div class="job-desc"><%=job.getJobDescription()%></div>
				<div class="countdown" style="color: red;">
					Closing in
					<%=minutesLeft%>
					minutes
				</div>
				<a href="<%=job.getApplicationLink()%>" target="_blank"
					class="apply-btn" style="background: red;">Apply Now</a>
			</div>
			<%
			}
			}
			%>
		</div>

		<!-- Open Applications -->
		<div id="open-applications" class="job-list hidden">
			<%
			for (JobLink job : jl) {
				if (job.getClosingDateTime().isAfter(now.plusHours(24))) {
			%>
			<div class="job-card">
				<div class="job-title"><%=job.getCompanyName()%></div>
				<div class="job-desc"><%=job.getJobDescription()%></div>
				<div class="countdown" style="color: green;">
					Closing on
					<%=job.getClosingDateTime().format(formatter)%></div>
				<a href="<%=job.getApplicationLink()%>" target="_blank"
					class="apply-btn" style="background: #007bff;">Apply Now</a>
			</div>
			<%
			}
			}
			%>
		</div>

		<!-- Closed Applications -->
		<div id="closed-applications" class="job-list hidden">
			<%
			for (JobLink job : jl) {
				if (job.getClosingDateTime().isBefore(now)) {
			%>
			<div class="job-card">
				<div class="job-title"><%=job.getCompanyName()%></div>
				<div class="job-desc"><%=job.getJobDescription()%></div>
				<div class="countdown" style="color: gray;">Application Closed</div>
				<a href="#" class="apply-btn disabled">Closed</a>
			</div>
			<%
			}
			}
			%>
		</div>

	</div>
</body>
</html>
