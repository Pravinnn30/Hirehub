<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Jobs | Hirehub</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <style>
            body {
                background-color: #f5f7fa;
            }

            .job-card {
                display: block;
                background: white;
                padding: 20px;
                border-radius: 10px;
                margin-bottom: 20px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            }

            .job-title {
                font-size: 22px;
                font-weight: 600;
            }

            .job-meta {
                color: #666;
                font-size: 14px;
            }
            .det {
                display: flex;
                justify-content: space-between;
            }
            .pagination {
                justify-content: center;
            }
            .edit {
                display: flex;
                justify-content: end;
            }
            @media (max-width: 500px) {
                .det {
                    flex-direction: column;
                    gap: 10px;
                }            
            }
            /* Make job layout friendlier on mid-size screens (tablets / small laptops) */
            @media (max-width: 990px) {
                .job-card { padding: 16px; }
                .job-title { font-size: 18px; }
                .det { flex-direction: column; gap: 8px; align-items: flex-start; }
                .det p { margin: 0; width: 100%; }
                .det p b { display: inline-block; min-width: 90px; }
                .job-meta { display:block; margin-top:6px; }
                .job-card p { word-break:break-word; }
            }
        </style>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>

        <jsp:include page="header.jsp" />

        <div class="container mt-5">
            <h2 class="mb-4 text-center">Latest Job Openings</h2>
            <c:if test="${deleteError}">
                <p class="alert alert-danger" style="text-align: center;">There occur an error while deleting this job. Please try again.</p>
                <c:remove var="deleteError"/>
            </c:if>     
            <c:if test="${deleteJob}">
                <p class="alert alert-success" style="text-align: center;">Job deleted successfully.</p>
                <c:remove var="deleteJob"/>
            </c:if>    
            <!-- Inline filter section (separate from header search) -->
            <form class="row g-2 mb-3" method="get" action="viewJobServlet">
                <input type="hidden" name="from" value="advancedFilters">
                <div class="col-12 col-sm-4">
                    <input id="q" name="q" class="form-control" placeholder="Search title or skills" value="${param.q}">
                </div>
                <div class="col-6 col-sm-3">
                    <input id="location" name="location" class="form-control" placeholder="Location" value="${param.location}">
                </div>
                <div class="col-6 col-sm-3">
                    <input id="company" name="company" class="form-control" placeholder="Company" value="${param.company}">
                </div>
                <div class="col-12 col-sm-2 d-grid">
                    <button class="btn btn-primary" type="submit">Search</button>
                </div>
            </form>
            
            <!-- Advanced filters (collapsible) -->
            <div class="mb-4">
                <button class="btn btn-sm btn-link" id="toggleAdvanced">Advanced filters ▾</button>
                <div id="advancedFilters" style="display:none; margin-top:12px;">
                    <form class="row g-2" method="get" action="viewJobServlet">
                        <!-- <input type="hidden" name="q" value="${param.q}">
                        <input type="hidden" name="location" value="${param.location}">
                        <input type="hidden" name="company" value="${param.company}"> -->

                        <input type="hidden" name="from" value="advancedFilters">
                        <div class="col-6 col-sm-3">
                            <select name="experience" class="form-select">
                                <option value="">Any experience</option>
                                <option value="Fresher" ${param.experience == 'Fresher' ? 'selected' : ''}>Fresher</option>
                                <option value="1-2 Years" ${param.experience == '1-2 Years' ? 'selected' : ''}>1-2 years</option>
                                <option value="2-5 Years" ${param.experience == '2-5 Years' ? 'selected' : ''}>2-5 years</option>
                                <option value="5+ Years" ${param.experience == '5+ Years' ? 'selected' : ''}>5+ years</option>
                            </select>
                        </div>
                        <div class="col-6 col-sm-3">
                            <select name="salaryRange" class="form-select">
                                <option value="">Any salary</option>
                                <option value="0-3" ${param.salaryRange == '0-3' ? 'selected' : ''}>0-3 LPA</option>
                                <option value="3-6" ${param.salaryRange == '3-6' ? 'selected' : ''}>3-6 LPA</option>
                                <option value="6-12" ${param.salaryRange == '6-12' ? 'selected' : ''}>6-12 LPA</option>
                                <option value="12+" ${param.salaryRange == '12+' ? 'selected' : ''}>12+ LPA</option>
                            </select>
                        </div>
                        <div class="col-12 col-sm-6 d-grid">
                            <button id="advancedbutton" class="btn btn-outline-secondary" type="submit">Apply Advanced Filters</button>
                        </div>
                    </form>
                    
                </div>
            </div>

            <c:if test="${noJob}">
                <div class="job-card">
                    <div style="margin: 0 auto; height: 250px; font-size: 2rem;" class="d-flex justify-content-between">
                        <p style="text-align: center;">No such job.</p>
                    </div>
                </div>
            </c:if>
            <c:remove var="noJob"/>

            <c:forEach var="job" items="${jobs}">
                <div class="job-card">
                    <div class="d-flex justify-content-between">
                        <h4 class="job-title">${job.title}</h4>
                        <span class="text-muted">${job.postedDate}</span>
                    </div>

                    <div class="det">
                        <p><b>Company:</b> 
                            <a href="${job.companyWebsite}" target="_blank">
                                ${job.companyName}
                            </a>
                        </p>

                        <p><b>Location:</b> ${job.location}</p>
                        <p><b>Experience:</b> ${job.experience}</p>
                        <p><b>Skills:</b> ${job.skills}</p>
                        <p><b>Salary:</b> ${job.salary} LPA</p>
                    </div>
                    
                    <p>${job.description}</p>
                    <c:if test="${session_user.userStatus == 'admin'}">
                        <div class="edit">
                            <form action="deleteServlet" method="get">
                                <input type="hidden" name="jobId" value="${job.jobId}">
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>

                        </div>
                    </c:if>

                    <div class="d-flex justify-content-between" style="margin-top: 8px;">
                        <h5 class="lateDate">LastDate of Application: ${job.lastDate}</h5>
                    </div>
                </div>
            </c:forEach>

            <c:remove var="jobs"/>

            <!-- PAGINATION -->
            <nav>
                <ul class="pagination">

                    <!-- Previous -->
                    <c:if test="${currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="viewJobServlet?page=${currentPage - 1}">Previous</a>
                        </li>
                    </c:if>

                    <!-- Page Numbers -->
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                            <a class="page-link" href="viewJobServlet?page=${i}">${i}</a>
                        </li>
                    </c:forEach>

                    <!-- Next -->
                    <c:if test="${currentPage < totalPages}">
                        <li class="page-item">
                            <a class="page-link" href="viewJobServlet?page=${currentPage + 1}">Next</a>
                        </li>
                    </c:if>
                </ul>
            </nav>
        </div>

        <jsp:include page="footer.jsp" />
        
        <script>
            document.addEventListener('DOMContentLoaded', function(){
                // Find header search input: first input[name=q] that is not inside .container
                var allQ = Array.from(document.querySelectorAll('input[name="q"]'));
                var headerQ = null;
                for(var i=0;i<allQ.length;i++){
                    if(!allQ[i].closest('.container')){ headerQ = allQ[i]; break; }
                }
                if(headerQ){
                    var headerForm = headerQ.closest('form');
                    if(headerForm){
                        headerForm.addEventListener('submit', function(){
                            // copy current filter values from this page into header form as hidden inputs
                            ['location','company','experience','salaryRange'].forEach(function(name){
                                var src = document.querySelector('[name="'+name+'"]');
                                var val = src ? src.value : '';
                                if(val){
                                    var existing = headerForm.querySelector('input[name="'+name+'"]');
                                    if(!existing){
                                        existing = document.createElement('input'); existing.type='hidden'; existing.name=name; headerForm.appendChild(existing);
                                    }
                                    existing.value = val;
                                }
                            });
                        });
                        // also set header input value from server param if present
                        var serverQ = '${param.q}';
                        if(serverQ && headerQ.value !== serverQ) headerQ.value = serverQ;
                    }
                }

                // Advanced filter toggle
                var toggle = document.getElementById('toggleAdvanced');
                if(toggle){
                    toggle.addEventListener('click', function(e){
                        e.preventDefault();
                        var adv = document.getElementById('advancedFilters');
                        if(!adv) return;
                        if(adv.style.display === 'none' || adv.style.display === ''){ adv.style.display = 'block'; toggle.textContent = 'Advanced filters ▴'; }
                        else { adv.style.display = 'none'; toggle.textContent = 'Advanced filters ▾'; }
                    });
                }
                document.getElementById('advancedbutton').addEventListener('click', () => {
                    let q = document.getElementById('q');
                    let location = document.getElementById('location');
                    let company = document.getElementById('company');

                    let input1 = document.createElement('input');
                    let input2 = document.createElement('input');
                    let input3 = document.createElement('input');
                    input1.type = 'hidden';
                    input2.type = 'hidden';
                    input3.type = 'hidden';
                    input1.name = 'q';                    
                    input2.name = 'location';
                    input3.name = 'company';
                    input1.value = q.value;
                    input2.value = location.value;
                    input3.value = company.value;
                    toggle.nextElementSibling.children[0].appendChild(input1);
                    toggle.nextElementSibling.children[0].appendChild(input2);
                    toggle.nextElementSibling.children[0].appendChild(input3);
                });

                // Remove inline confirm; use modal-based confirmation handled below
            });
        </script>

        <!-- Confirmation modal (styled lightweight) -->
        <div id="deleteModal" style="display:none; position:fixed; inset:0; background:rgba(0,0,0,0.45); align-items:center; justify-content:center; z-index:9999;">
            <div style="background:#fff; padding:18px; border-radius:8px; max-width:460px; width:92%; box-shadow:0 12px 30px rgba(0,0,0,0.18);">
                <h5 id="deleteModalTitle">Confirm delete</h5>
                <p id="deleteModalBody" style="color:#333; margin-top:8px">Are you sure?</p>
                <input type="hidden" id="deleteModalId" value="">
                <div style="display:flex; gap:10px; justify-content:flex-end; margin-top:14px">
                    <button id="deleteModalCancel" class="btn btn-secondary">Cancel</button>
                    <button id="deleteModalConfirm" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>

        <script>
            // Open delete modal when Delete button inside .edit is clicked
            document.addEventListener('click', function(e){
                var btn = e.target.closest('.edit .btn-danger, .edit button.btn-danger, .btn-delete');
                if(!btn) return;
                e.preventDefault();
                // find id in nearby form inputs or data attribute
                var form = btn.closest('form');
                var id = '';
                if(form){
                    var jid = form.querySelector('input[name="jobId"]');
                    var iid = form.querySelector('input[name="id"]');
                    if(jid) id = jid.value;
                    else if(iid) id = iid.value;
                }
                if(!id) id = btn.dataset.id || '';
                // set modal text and hidden id
                var title = btn.dataset.title || (form ? (form.dataset.title || '') : '');
                document.getElementById('deleteModalTitle').textContent = 'Delete Job';
                document.getElementById('deleteModalBody').textContent = 'Delete: This action cannot be undone.';
                var hid = document.getElementById('deleteModalId'); if(hid) hid.value = id;
                // show modal
                var modal = document.getElementById('deleteModal'); if(modal) modal.style.display = 'flex';
            });

            // Cancel button hides modal
            document.getElementById('deleteModalCancel').addEventListener('click', function(){
                var modal = document.getElementById('deleteModal'); if(modal) modal.style.display = 'none';
            });

            // Confirm: submit the nearest form that contains an input matching the stored id
            document.getElementById('deleteModalConfirm').addEventListener('click', function(){
                var modal = document.getElementById('deleteModal'); if(!modal) return;
                var id = document.getElementById('deleteModalId') ? document.getElementById('deleteModalId').value : '';
                // try to find a form with matching hidden input first
                var selector = 'form input[name="jobId"][value="' + id + '"]';
                var node = document.querySelector(selector);
                var formToSubmit = null;
                if(node) formToSubmit = node.closest('form');
                else {
                    selector = 'form input[name="id"][value="' + id + '"]'; node = document.querySelector(selector);
                    if(node) formToSubmit = node.closest('form');
                }
                // fallback: submit the first form.delete-form in same .job-card
                if(!formToSubmit){
                    var btn = document.querySelector('.btn-delete[data-id="' + id + '"]');
                    if(btn) formToSubmit = btn.closest('form');
                }
                if(formToSubmit){
                    formToSubmit.submit();
                } else {
                    // fallback navigate
                    if(id) window.location.href = 'deleteServlet?id=' + encodeURIComponent(id);
                }
                if(modal) modal.style.display = 'none';
            });
        </script>

    </body>
</html>