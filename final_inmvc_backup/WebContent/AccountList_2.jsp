<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeList.jsp</title>

<!-- 통일하기로 한 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" 
integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</head>
<body>

<!-- 내비바 -->
<div><c:import url="MenuNavbar_new.jsp"></c:import></div>

<div class="content container-fluid" data-select2-id="58">
        <!-- Page Header -->
        <div class="page-header">
          <div class="row align-items-center">
            <div class="col-sm mb-2 mb-sm-0">
              <h1 class="page-header-title">Dashboard</h1>
            </div>

            <div class="col-sm-auto">
              <a class="btn btn-primary" href="javascript:;" data-toggle="modal" data-target="#inviteUserModal">
                <i class="tio-user-add mr-1"></i> Invite users
              </a>
            </div>
          </div>
        </div>
        <!-- End Page Header -->

        <!-- Stats -->
        <div class="row gx-2 gx-lg-3">
          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
            <!-- Card -->
            <a class="card card-hover-shadow h-100" href="#">
              <div class="card-body">
                <h6 class="card-subtitle">Total Users</h6>

                <div class="row align-items-center gx-2 mb-1">
                  <div class="col-6">
                    <span class="card-title h2">72,540</span>
                  </div>

                  <div class="col-6">
                    <!-- Chart -->
                    <div class="chartjs-custom" style="height: 3rem;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                      <canvas class="js-chart chartjs-render-monitor" data-hs-chartjs-options="{
                                &quot;type&quot;: &quot;line&quot;,
                                &quot;data&quot;: {
                                   &quot;labels&quot;: [&quot;1 May&quot;,&quot;2 May&quot;,&quot;3 May&quot;,&quot;4 May&quot;,&quot;5 May&quot;,&quot;6 May&quot;,&quot;7 May&quot;,&quot;8 May&quot;,&quot;9 May&quot;,&quot;10 May&quot;,&quot;11 May&quot;,&quot;12 May&quot;,&quot;13 May&quot;,&quot;14 May&quot;,&quot;15 May&quot;,&quot;16 May&quot;,&quot;17 May&quot;,&quot;18 May&quot;,&quot;19 May&quot;,&quot;20 May&quot;,&quot;21 May&quot;,&quot;22 May&quot;,&quot;23 May&quot;,&quot;24 May&quot;,&quot;25 May&quot;,&quot;26 May&quot;,&quot;27 May&quot;,&quot;28 May&quot;,&quot;29 May&quot;,&quot;30 May&quot;,&quot;31 May&quot;],
                                   &quot;datasets&quot;: [{
                                    &quot;data&quot;: [21,20,24,20,18,17,15,17,18,30,31,30,30,35,25,35,35,40,60,90,90,90,85,70,75,70,30,30,30,50,72],
                                    &quot;backgroundColor&quot;: [&quot;rgba(55, 125, 255, 0)&quot;, &quot;rgba(255, 255, 255, 0)&quot;],
                                    &quot;borderColor&quot;: &quot;#377dff&quot;,
                                    &quot;borderWidth&quot;: 2,
                                    &quot;pointRadius&quot;: 0,
                                    &quot;pointHoverRadius&quot;: 0
                                  }]
                                },
                                &quot;options&quot;: {
                                   &quot;scales&quot;: {
                                     &quot;yAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }],
                                     &quot;xAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }]
                                   },
                                  &quot;hover&quot;: {
                                    &quot;mode&quot;: &quot;nearest&quot;,
                                    &quot;intersect&quot;: false
                                  },
                                  &quot;tooltips&quot;: {
                                    &quot;postfix&quot;: &quot;k&quot;,
                                    &quot;hasIndicator&quot;: true,
                                    &quot;intersect&quot;: false
                                  }
                                }
                              }" style="display: block; height: 48px; width: 91px;" width="136" height="72">
                      </canvas>
                    </div>
                    <!-- End Chart -->
                  </div>
                </div>
                <!-- End Row -->

                <span class="badge badge-soft-success">
                  <i class="tio-trending-up"></i> 12.5%
                </span>
                <span class="text-body font-size-sm ml-1">from 70,104</span>
              </div>
            </a>
            <!-- End Card -->
          </div>

          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
            <!-- Card -->
            <a class="card card-hover-shadow h-100" href="#">
              <div class="card-body">
                <h6 class="card-subtitle">Sessions</h6>

                <div class="row align-items-center gx-2 mb-1">
                  <div class="col-6">
                    <span class="card-title h2">29.4%</span>
                  </div>

                  <div class="col-6">
                    <!-- Chart -->
                    <div class="chartjs-custom" style="height: 3rem;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                      <canvas class="js-chart chartjs-render-monitor" data-hs-chartjs-options="{
                                &quot;type&quot;: &quot;line&quot;,
                                &quot;data&quot;: {
                                   &quot;labels&quot;: [&quot;1 May&quot;,&quot;2 May&quot;,&quot;3 May&quot;,&quot;4 May&quot;,&quot;5 May&quot;,&quot;6 May&quot;,&quot;7 May&quot;,&quot;8 May&quot;,&quot;9 May&quot;,&quot;10 May&quot;,&quot;11 May&quot;,&quot;12 May&quot;,&quot;13 May&quot;,&quot;14 May&quot;,&quot;15 May&quot;,&quot;16 May&quot;,&quot;17 May&quot;,&quot;18 May&quot;,&quot;19 May&quot;,&quot;20 May&quot;,&quot;21 May&quot;,&quot;22 May&quot;,&quot;23 May&quot;,&quot;24 May&quot;,&quot;25 May&quot;,&quot;26 May&quot;,&quot;27 May&quot;,&quot;28 May&quot;,&quot;29 May&quot;,&quot;30 May&quot;,&quot;31 May&quot;],
                                   &quot;datasets&quot;: [{
                                    &quot;data&quot;: [21,20,24,20,18,17,15,17,30,30,35,25,18,30,31,35,35,90,90,90,85,100,120,120,120,100,90,75,75,75,90],
                                    &quot;backgroundColor&quot;: [&quot;rgba(55, 125, 255, 0)&quot;, &quot;rgba(255, 255, 255, 0)&quot;],
                                    &quot;borderColor&quot;: &quot;#377dff&quot;,
                                    &quot;borderWidth&quot;: 2,
                                    &quot;pointRadius&quot;: 0,
                                    &quot;pointHoverRadius&quot;: 0
                                  }]
                                },
                                &quot;options&quot;: {
                                   &quot;scales&quot;: {
                                     &quot;yAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }],
                                     &quot;xAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }]
                                   },
                                  &quot;hover&quot;: {
                                    &quot;mode&quot;: &quot;nearest&quot;,
                                    &quot;intersect&quot;: false
                                  },
                                  &quot;tooltips&quot;: {
                                    &quot;postfix&quot;: &quot;%&quot;,
                                    &quot;hasIndicator&quot;: true,
                                    &quot;intersect&quot;: false
                                  }
                                }
                              }" width="136" height="72" style="display: block; height: 48px; width: 91px;">
                      </canvas>
                    </div>
                    <!-- End Chart -->
                  </div>
                </div>
                <!-- End Row -->

                <span class="badge badge-soft-success">
                  <i class="tio-trending-up"></i> 1.7%
                </span>
                <span class="text-body font-size-sm ml-1">from 29.1%</span>
              </div>
            </a>
            <!-- End Card -->
          </div>

          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
            <!-- Card -->
            <a class="card card-hover-shadow h-100" href="#">
              <div class="card-body">
                <h6 class="card-subtitle">Avg. Click Rate</h6>

                <div class="row align-items-center gx-2 mb-1">
                  <div class="col-6">
                    <span class="card-title h2">56.8%</span>
                  </div>

                  <div class="col-6">
                    <!-- Chart -->
                    <div class="chartjs-custom" style="height: 3rem;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                      <canvas class="js-chart chartjs-render-monitor" data-hs-chartjs-options="{
                                &quot;type&quot;: &quot;line&quot;,
                                &quot;data&quot;: {
                                   &quot;labels&quot;: [&quot;1 May&quot;,&quot;2 May&quot;,&quot;3 May&quot;,&quot;4 May&quot;,&quot;5 May&quot;,&quot;6 May&quot;,&quot;7 May&quot;,&quot;8 May&quot;,&quot;9 May&quot;,&quot;10 May&quot;,&quot;11 May&quot;,&quot;12 May&quot;,&quot;13 May&quot;,&quot;14 May&quot;,&quot;15 May&quot;,&quot;16 May&quot;,&quot;17 May&quot;,&quot;18 May&quot;,&quot;19 May&quot;,&quot;20 May&quot;,&quot;21 May&quot;,&quot;22 May&quot;,&quot;23 May&quot;,&quot;24 May&quot;,&quot;25 May&quot;,&quot;26 May&quot;,&quot;27 May&quot;,&quot;28 May&quot;,&quot;29 May&quot;,&quot;30 May&quot;,&quot;31 May&quot;],
                                   &quot;datasets&quot;: [{
                                    &quot;data&quot;: [25,18,30,31,35,35,60,60,60,75,21,20,24,20,18,17,15,17,30,120,120,120,100,90,75,90,90,90,75,70,60],
                                    &quot;backgroundColor&quot;: [&quot;rgba(55, 125, 255, 0)&quot;, &quot;rgba(255, 255, 255, 0)&quot;],
                                    &quot;borderColor&quot;: &quot;#377dff&quot;,
                                    &quot;borderWidth&quot;: 2,
                                    &quot;pointRadius&quot;: 0,
                                    &quot;pointHoverRadius&quot;: 0
                                  }]
                                },
                                &quot;options&quot;: {
                                   &quot;scales&quot;: {
                                     &quot;yAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }],
                                     &quot;xAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }]
                                   },
                                  &quot;hover&quot;: {
                                    &quot;mode&quot;: &quot;nearest&quot;,
                                    &quot;intersect&quot;: false
                                  },
                                  &quot;tooltips&quot;: {
                                    &quot;postfix&quot;: &quot;%&quot;,
                                    &quot;hasIndicator&quot;: true,
                                    &quot;intersect&quot;: false
                                  }
                                }
                              }" width="136" height="72" style="display: block; height: 48px; width: 91px;">
                      </canvas>
                    </div>
                    <!-- End Chart -->
                  </div>
                </div>
                <!-- End Row -->

                <span class="badge badge-soft-danger">
                  <i class="tio-trending-down"></i> 4.4%
                </span>
                <span class="text-body font-size-sm ml-1">from 61.2%</span>
              </div>
            </a>
            <!-- End Card -->
          </div>

          <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
            <!-- Card -->
            <a class="card card-hover-shadow h-100" href="#">
              <div class="card-body">
                <h6 class="card-subtitle">Pageviews</h6>

                <div class="row align-items-center gx-2 mb-1">
                  <div class="col-6">
                    <span class="card-title h2">92,913</span>
                  </div>

                  <div class="col-6">
                    <!-- Chart -->
                    <div class="chartjs-custom" style="height: 3rem;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                      <canvas class="js-chart chartjs-render-monitor" data-hs-chartjs-options="{
                                &quot;type&quot;: &quot;line&quot;,
                                &quot;data&quot;: {
                                   &quot;labels&quot;: [&quot;1 May&quot;,&quot;2 May&quot;,&quot;3 May&quot;,&quot;4 May&quot;,&quot;5 May&quot;,&quot;6 May&quot;,&quot;7 May&quot;,&quot;8 May&quot;,&quot;9 May&quot;,&quot;10 May&quot;,&quot;11 May&quot;,&quot;12 May&quot;,&quot;13 May&quot;,&quot;14 May&quot;,&quot;15 May&quot;,&quot;16 May&quot;,&quot;17 May&quot;,&quot;18 May&quot;,&quot;19 May&quot;,&quot;20 May&quot;,&quot;21 May&quot;,&quot;22 May&quot;,&quot;23 May&quot;,&quot;24 May&quot;,&quot;25 May&quot;,&quot;26 May&quot;,&quot;27 May&quot;,&quot;28 May&quot;,&quot;29 May&quot;,&quot;30 May&quot;,&quot;31 May&quot;],
                                   &quot;datasets&quot;: [{
                                    &quot;data&quot;: [21,20,24,15,17,30,30,35,35,35,40,60,12,90,90,85,70,75,43,75,90,22,120,120,90,85,100,92,92,92,92],
                                    &quot;backgroundColor&quot;: [&quot;rgba(55, 125, 255, 0)&quot;, &quot;rgba(255, 255, 255, 0)&quot;],
                                    &quot;borderColor&quot;: &quot;#377dff&quot;,
                                    &quot;borderWidth&quot;: 2,
                                    &quot;pointRadius&quot;: 0,
                                    &quot;pointHoverRadius&quot;: 0
                                  }]
                                },
                                &quot;options&quot;: {
                                   &quot;scales&quot;: {
                                     &quot;yAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }],
                                     &quot;xAxes&quot;: [{
                                       &quot;display&quot;: false
                                     }]
                                   },
                                  &quot;hover&quot;: {
                                    &quot;mode&quot;: &quot;nearest&quot;,
                                    &quot;intersect&quot;: false
                                  },
                                  &quot;tooltips&quot;: {
                                    &quot;postfix&quot;: &quot;k&quot;,
                                    &quot;hasIndicator&quot;: true,
                                    &quot;intersect&quot;: false
                                  }
                                }
                              }" width="136" height="72" style="display: block; height: 48px; width: 91px;">
                      </canvas>
                    </div>
                    <!-- End Chart -->
                  </div>
                </div>
                <!-- End Row -->

                <span class="badge badge-soft-secondary">0.0%</span>
                <span class="text-body font-size-sm ml-1">from 2,913</span>
              </div>
            </a>
            <!-- End Card -->
          </div>
        </div>
        <!-- End Stats -->

        <div class="row gx-2 gx-lg-3">
          <div class="col-lg-5 mb-3 mb-lg-5">
            <!-- Card -->
            <div class="card h-100">
              <!-- Header -->
              <div class="card-header">
                <h5 class="card-header-title">Import data into Front Dashboard</h5>

                <!-- Unfold -->
                <div class="hs-unfold">
                  <a class="js-hs-unfold-invoker btn btn-icon btn-sm btn-ghost-secondary rounded-circle" href="javascript:;" data-hs-unfold-options="{
                       &quot;target&quot;: &quot;#reportsOverviewDropdown2&quot;,
                       &quot;type&quot;: &quot;css-animation&quot;
                     }" data-hs-unfold-target="#reportsOverviewDropdown2" data-hs-unfold-invoker="">
                    <i class="tio-more-vertical"></i>
                  </a>

                  <div id="reportsOverviewDropdown2" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right mt-1 hs-unfold-hidden hs-unfold-content-initialized hs-unfold-css-animation animated" data-hs-target-height="248" data-hs-unfold-content="" data-hs-unfold-content-animation-in="slideInUp" data-hs-unfold-content-animation-out="fadeOut" style="animation-duration: 300ms;">
                    <span class="dropdown-header">Settings</span>

                    <a class="dropdown-item" href="#">
                      <i class="tio-share dropdown-item-icon"></i> Share chart
                    </a>
                    <a class="dropdown-item" href="#">
                      <i class="tio-download-to dropdown-item-icon"></i> Download
                    </a>
                    <a class="dropdown-item" href="#">
                      <i class="tio-alt dropdown-item-icon"></i> Connect other apps
                    </a>

                    <div class="dropdown-divider"></div>

                    <span class="dropdown-header">Feedback</span>

                    <a class="dropdown-item" href="#">
                      <i class="tio-chat-outlined dropdown-item-icon"></i> Report
                    </a>
                  </div>
                </div>
                <!-- End Unfold -->
              </div>
              <!-- End Header -->

              <!-- Body -->
              <div class="card-body">
                <p>See and talk to your users and leads immediately by importing your data into the Front Dashboard platform.</p>

                <ul class="list-group list-group-flush list-group-no-gutters">
                  <li class="list-group-item py-3">
                    <h5 class="modal-title">Import users from:</h5>
                  </li>

                  <!-- List Group Item -->
                  <li class="list-group-item py-3">
                    <div class="media">
                      <div class="mt-1 mr-3">
                        <img class="avatar avatar-xs avatar-4by3" src="./assets/svg/brands/capsule.svg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <div class="row align-items-center">
                          <div class="col">
                            <h5 class="mb-0">Capsule</h5>
                            <span class="d-block font-size-sm">Users</span>
                          </div>

                          <div class="col-auto">
                            <a class="btn btn-sm btn-primary" href="#" title="Launch importer" target="_blank">
                              Launch <span class="d-none d-sm-inline-block">importer</span>
                              <i class="tio-open-in-new ml-1"></i>
                            </a>
                          </div>
                        </div>
                        <!-- End Row -->
                      </div>
                    </div>
                  </li>
                  <!-- End List Group Item -->

                  <!-- List Group Item -->
                  <li class="list-group-item py-3">
                    <div class="media">
                      <div class="mt-1 mr-3">
                        <img class="avatar avatar-xs avatar-4by3" src="./assets/svg/brands/mailchimp.svg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <div class="row align-items-center">
                          <div class="col">
                            <h5 class="mb-0">Mailchimp</h5>
                            <span class="d-block font-size-sm">Users</span>
                          </div>

                          <div class="col-auto">
                            <a class="btn btn-sm btn-primary" href="#" title="Launch importer" target="_blank">
                              Launch <span class="d-none d-sm-inline-block">importer</span>
                              <i class="tio-open-in-new ml-1"></i>
                            </a>
                          </div>
                        </div>
                        <!-- End Row -->
                      </div>
                    </div>
                  </li>
                  <!-- End List Group Item -->

                  <!-- List Group Item -->
                  <li class="list-group-item py-3">
                    <div class="media">
                      <div class="mt-1 mr-3">
                        <img class="avatar avatar-xs avatar-4by3" src="./assets/svg/brands/google-webdev.svg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <div class="row align-items-center">
                          <div class="col">
                            <h5 class="mb-0">Webdev</h5>
                            <span class="d-block font-size-sm">Users</span>
                          </div>

                          <div class="col-auto">
                            <a class="btn btn-sm btn-primary" href="#" title="Launch importer" target="_blank">
                              Launch <span class="d-none d-sm-inline-block">importer</span>
                              <i class="tio-open-in-new ml-1"></i>
                            </a>
                          </div>
                        </div>
                        <!-- End Row -->
                      </div>
                    </div>
                  </li>
                  <!-- End List Group Item -->

                  <li class="list-group-item"><small>Or you can <a href="#">sync data to Front Dashboard</a> to ensure your data is always up-to-date.</small></li>
                </ul>
              </div>
              <!-- End Body -->
            </div>
            <!-- End Card -->
          </div>

          <div class="col-lg-7 mb-3 mb-lg-5">
            <!-- Card -->
            <div class="card h-100">
              <!-- Header -->
              <div class="card-header">
                <h5 class="card-header-title">Monthly expenses</h5>

                <!-- Nav -->
                <ul class="nav nav-segment" id="expensesTab" role="tablist">
                  <li class="nav-item" data-toggle="chart-bar" data-datasets="thisWeek" data-trigger="click" data-action="toggle">
                    <a class="nav-link active" href="javascript:;" data-toggle="tab">This week</a>
                  </li>
                  <li class="nav-item" data-toggle="chart-bar" data-datasets="lastWeek" data-trigger="click" data-action="toggle">
                    <a class="nav-link" href="javascript:;" data-toggle="tab">Last week</a>
                  </li>
                </ul>
                <!-- End Nav -->
              </div>
              <!-- End Header -->

              <!-- Body -->
              <div class="card-body">
                <div class="row mb-4">
                  <div class="col-sm mb-2 mb-sm-0">
                    <div class="d-flex align-items-center">
                      <span class="h1 mb-0">35%</span>
                      <span class="text-success ml-2">
                        <i class="tio-trending-up"></i> 25.3%
                      </span>
                    </div>
                  </div>

                  <div class="col-sm-auto align-self-sm-end">
                    <!-- Legend Indicators -->
                    <div class="row font-size-sm">
                      <div class="col-auto">
                        <span class="legend-indicator bg-primary"></span> New
                      </div>
                      <div class="col-auto">
                        <span class="legend-indicator"></span> Overdue
                      </div>
                    </div>
                    <!-- End Legend Indicators -->
                  </div>
                </div>
                <!-- End Row -->

                <!-- Bar Chart -->
                <div class="chartjs-custom"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas id="updatingData" style="height: 320px; display: block; width: 566px;" data-hs-chartjs-options="{
                            &quot;type&quot;: &quot;bar&quot;,
                            &quot;data&quot;: {
                              &quot;labels&quot;: [&quot;May 1&quot;, &quot;May 2&quot;, &quot;May 3&quot;, &quot;May 4&quot;, &quot;May 5&quot;, &quot;May 6&quot;, &quot;May 7&quot;, &quot;May 8&quot;, &quot;May 9&quot;, &quot;May 10&quot;],
                              &quot;datasets&quot;: [{
                                &quot;data&quot;: [200, 300, 290, 350, 150, 350, 300, 100, 125, 220],
                                &quot;backgroundColor&quot;: &quot;#377dff&quot;,
                                &quot;hoverBackgroundColor&quot;: &quot;#377dff&quot;,
                                &quot;borderColor&quot;: &quot;#377dff&quot;
                              },
                              {
                                &quot;data&quot;: [150, 230, 382, 204, 169, 290, 300, 100, 300, 225, 120],
                                &quot;backgroundColor&quot;: &quot;#e7eaf3&quot;,
                                &quot;borderColor&quot;: &quot;#e7eaf3&quot;
                              }]
                            },
                            &quot;options&quot;: {
                              &quot;scales&quot;: {
                                &quot;yAxes&quot;: [{
                                  &quot;gridLines&quot;: {
                                    &quot;color&quot;: &quot;#e7eaf3&quot;,
                                    &quot;drawBorder&quot;: false,
                                    &quot;zeroLineColor&quot;: &quot;#e7eaf3&quot;
                                  },
                                  &quot;ticks&quot;: {
                                    &quot;beginAtZero&quot;: true,
                                    &quot;stepSize&quot;: 100,
                                    &quot;fontSize&quot;: 12,
                                    &quot;fontColor&quot;: &quot;#97a4af&quot;,
                                    &quot;fontFamily&quot;: &quot;Open Sans, sans-serif&quot;,
                                    &quot;padding&quot;: 10,
                                    &quot;postfix&quot;: &quot;$&quot;
                                  }
                                }],
                                &quot;xAxes&quot;: [{
                                  &quot;gridLines&quot;: {
                                    &quot;display&quot;: false,
                                    &quot;drawBorder&quot;: false
                                  },
                                  &quot;ticks&quot;: {
                                    &quot;fontSize&quot;: 12,
                                    &quot;fontColor&quot;: &quot;#97a4af&quot;,
                                    &quot;fontFamily&quot;: &quot;Open Sans, sans-serif&quot;,
                                    &quot;padding&quot;: 5
                                  },
                                  &quot;categoryPercentage&quot;: 0.5,
                                  &quot;maxBarThickness&quot;: &quot;10&quot;
                                }]
                              },
                              &quot;cornerRadius&quot;: 2,
                              &quot;tooltips&quot;: {
                                &quot;prefix&quot;: &quot;$&quot;,
                                &quot;hasIndicator&quot;: true,
                                &quot;mode&quot;: &quot;index&quot;,
                                &quot;intersect&quot;: false
                              },
                              &quot;hover&quot;: {
                                &quot;mode&quot;: &quot;nearest&quot;,
                                &quot;intersect&quot;: true
                              }
                            }
                          }" width="849" height="480" class="chartjs-render-monitor"></canvas>
                </div>
                <!-- End Bar Chart -->
              </div>
              <!-- End Body -->
            </div>
            <!-- End Card -->
          </div>
        </div>
        <!-- End Row -->

        <!-- Card -->
        <div class="card mb-3 mb-lg-5" data-select2-id="57">
          <!-- Header -->
          <div class="card-header" data-select2-id="56">
            <div class="row justify-content-between align-items-center flex-grow-1" data-select2-id="55">
              <div class="col-12 col-md">
                <div class="d-flex justify-content-between align-items-center">
                  <h5 class="card-header-title">Users</h5>

                  <!-- Datatable Info -->
                  <div id="datatableCounterInfo" style="display: none;">
                    <div class="d-flex align-items-center">
                      <span class="font-size-sm mr-3">
                        <span id="datatableCounter">0</span>
                        Selected
                      </span>
                      <a class="btn btn-sm btn-outline-danger" href="javascript:;">
                        <i class="tio-delete-outlined"></i> Delete
                      </a>
                    </div>
                  </div>
                  <!-- End Datatable Info -->
                </div>
              </div>

              <div class="col-auto" data-select2-id="54">
                <!-- Filter -->
                <div class="row align-items-sm-center" data-select2-id="53">
                  <div class="col-sm-auto" data-select2-id="52">
                    <div class="d-flex align-items-center mr-2">
                      <span class="text-secondary mr-2">Status:</span>

                      <!-- Select -->
                      <select class="js-select2-custom js-datatable-filter custom-select-sm select2-hidden-accessible" size="1" style="opacity: 0;" data-target-column-index="2" data-hs-select2-options="{
                                &quot;minimumResultsForSearch&quot;: &quot;Infinity&quot;,
                                &quot;customClass&quot;: &quot;custom-select custom-select-sm custom-select-borderless&quot;,
                                &quot;dropdownAutoWidth&quot;: true,
                                &quot;width&quot;: true
                              }" data-select2-id="1" tabindex="-1" aria-hidden="true">
                        <option value="" data-select2-id="3">All</option>
                        <option value="successful" data-select2-id="4">Successful</option>
                        <option value="overdue" data-select2-id="5">Overdue</option>
                        <option value="pending" data-select2-id="6">Pending</option>
                      </select><span class="select2 select2-container select2-container--default select2-container--below" dir="ltr" data-select2-id="2" style="top: 0px;"><span class="selection"><span class="select2-selection custom-select custom-select-sm custom-select-borderless" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-gpoa-container"><span class="select2-selection__rendered" id="select2-gpoa-container" role="textbox" aria-readonly="true" title="All"><span>All</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                      <!-- End Select -->
                    </div>
                  </div>

                  <div class="col-sm-auto">
                    <div class="d-flex align-items-center mr-2">
                      <span class="text-secondary mr-2">Signed up:</span>

                      <!-- Select -->
                      <select class="js-select2-custom js-datatable-filter custom-select-sm select2-hidden-accessible" size="1" style="opacity: 0;" data-target-column-index="5" data-hs-select2-options="{
                                &quot;minimumResultsForSearch&quot;: &quot;Infinity&quot;,
                                &quot;customClass&quot;: &quot;custom-select custom-select-sm custom-select-borderless&quot;,
                                &quot;dropdownAutoWidth&quot;: true,
                                &quot;width&quot;: true
                              }" data-select2-id="7" tabindex="-1" aria-hidden="true">
                        <option value="" data-select2-id="9">All</option>
                        <option value="1 year ago" data-select2-id="10">1 year ago</option>
                        <option value="6 months ago" data-select2-id="11">6 months ago</option>
                      </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="8"><span class="selection"><span class="select2-selection custom-select custom-select-sm custom-select-borderless" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-dd9n-container"><span class="select2-selection__rendered" id="select2-dd9n-container" role="textbox" aria-readonly="true" title="All"><span>All</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                      <!-- End Select -->
                    </div>
                  </div>

                  <div class="col-md">
                    <form>
                      <!-- Search -->
                      <div class="input-group input-group-merge input-group-flush">
                        <div class="input-group-prepend">
                          <div class="input-group-text">
                            <i class="tio-search"></i>
                          </div>
                        </div>
                        <input id="datatableSearch" type="search" class="form-control" placeholder="Search users" aria-label="Search users">
                      </div>
                      <!-- End Search -->
                    </form>
                  </div>
                </div>
                <!-- End Filter -->
              </div>
            </div>
          </div>
          <!-- End Header -->

          <!-- Table -->
          <div class="table-responsive datatable-custom">
            <div id="datatable_wrapper" class="dataTables_wrapper no-footer"><div class="dataTables_length" id="datatable_length"><label>Show <select name="datatable_length" aria-controls="datatable" class=""><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div><div id="datatable_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="datatable"></label></div><table id="datatable" class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table dataTable no-footer" data-hs-datatables-options="{
                     &quot;columnDefs&quot;: [{
                        &quot;targets&quot;: [0, 1, 4],
                        &quot;orderable&quot;: false
                      }],
                     &quot;order&quot;: [],
                     &quot;info&quot;: {
                       &quot;totalQty&quot;: &quot;#datatableWithPaginationInfoTotalQty&quot;
                     },
                     &quot;search&quot;: &quot;#datatableSearch&quot;,
                     &quot;entries&quot;: &quot;#datatableEntries&quot;,
                     &quot;pageLength&quot;: 8,
                     &quot;isResponsive&quot;: false,
                     &quot;isShowPaging&quot;: false,
                     &quot;pagination&quot;: &quot;datatablePagination&quot;
                   }" role="grid" aria-describedby="datatable_info">
              <thead class="thead-light">
                <tr role="row"><th scope="col" class="table-column-pr-0 sorting_disabled" rowspan="1" colspan="1" aria-label="
                    
                      
                      
                    
                  " style="width: 43.6979px;">
                    <div class="custom-control custom-checkbox">
                      <input id="datatableCheckAll" type="checkbox" class="custom-control-input">
                      <label class="custom-control-label" for="datatableCheckAll"></label>
                    </div>
                  </th><th class="table-column-pl-0 sorting_disabled" rowspan="1" colspan="1" aria-label="Full name" style="width: 253.917px;">Full name</th><th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 137.312px;">Status</th><th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Type: activate to sort column ascending" style="width: 180.292px;">Type</th><th class="sorting_disabled" rowspan="1" colspan="1" aria-label="Email" style="width: 239.312px;">Email</th><th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Signed up: activate to sort column ascending" style="width: 146.771px;">Signed up</th><th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="User ID: activate to sort column ascending" style="width: 111.365px;">User ID</th></tr>
              </thead>

              <tbody>
                

                

                

                

                

                

                

                

                

                

                

                

                

                

                

                

                
              <tr role="row" class="odd">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck2">
                      <label class="custom-control-label" for="usersDataCheck2"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-circle mr-2">
                        <img class="avatar-img" src="./assets/img/160x160/img10.jpg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">Amanda Harvey <i class="tio-verified text-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Top endorsed"></i></span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-success"></span>Successful
                  </td>
                  <td>Unassigned</td>
                  <td>amanda@example.com</td>
                  <td>1 year ago</td>
                  <td>67989</td>
                </tr><tr role="row" class="even">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck3">
                      <label class="custom-control-label" for="usersDataCheck3"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-soft-primary avatar-circle mr-2">
                        <span class="avatar-initials">A</span>
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">Anne Richard</span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-success"></span>Successful
                  </td>
                  <td>Subscription</td>
                  <td>anne@example.com</td>
                  <td>6 months ago</td>
                  <td>67326</td>
                </tr><tr role="row" class="odd">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck4">
                      <label class="custom-control-label" for="usersDataCheck4"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-circle mr-2">
                        <img class="avatar-img" src="./assets/img/160x160/img3.jpg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">David Harrison</span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-danger"></span>Overdue
                  </td>
                  <td>Non-subscription</td>
                  <td>david@example.com</td>
                  <td>6 months ago</td>
                  <td>55821</td>
                </tr><tr role="row" class="even">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck5">
                      <label class="custom-control-label" for="usersDataCheck5"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-circle mr-2">
                        <img class="avatar-img" src="./assets/img/160x160/img5.jpg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">Finch Hoot</span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-warning"></span>Pending
                  </td>
                  <td>Subscription</td>
                  <td>finch@example.com</td>
                  <td>1 year ago</td>
                  <td>85214</td>
                </tr><tr role="row" class="odd">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck6">
                      <label class="custom-control-label" for="usersDataCheck6"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-soft-dark avatar-circle mr-2">
                        <span class="avatar-initials">B</span>
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">Bob Dean</span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-success"></span>Successful
                  </td>
                  <td>Subscription</td>
                  <td>bob@example.com</td>
                  <td>6 months ago</td>
                  <td>75470</td>
                </tr><tr role="row" class="even">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck7">
                      <label class="custom-control-label" for="usersDataCheck7"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-circle mr-2">
                        <img class="avatar-img" src="./assets/img/160x160/img9.jpg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">Ella Lauda <i class="tio-verified text-primary" data-toggle="tooltip" data-placement="top" title="" data-original-title="Top endorsed"></i></span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-warning"></span>Pending
                  </td>
                  <td>Subscription</td>
                  <td>Ella@example.com</td>
                  <td>1 year ago</td>
                  <td>37534</td>
                </tr><tr role="row" class="odd">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck8">
                      <label class="custom-control-label" for="usersDataCheck8"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-circle mr-2">
                        <img class="avatar-img" src="./assets/img/160x160/img4.jpg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">Sam Kart</span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-success"></span>Successful
                  </td>
                  <td>Non-subscription</td>
                  <td>sam@example.com</td>
                  <td>1 year ago</td>
                  <td>57300</td>
                </tr><tr role="row" class="even">
                  <td class="table-column-pr-0">
                    <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" id="usersDataCheck9">
                      <label class="custom-control-label" for="usersDataCheck9"></label>
                    </div>
                  </td>
                  <td class="table-column-pl-0">
                    <a class="media align-items-center" href="./user-profile.html">
                      <div class="avatar avatar-sm avatar-circle mr-2">
                        <img class="avatar-img" src="./assets/img/160x160/img6.jpg" alt="Image Description">
                      </div>
                      <div class="media-body">
                        <span class="h5 text-hover-primary mb-0">Costa Quinn</span>
                      </div>
                    </a>
                  </td>
                  <td>
                    <span class="legend-indicator bg-danger"></span>Overdue
                  </td>
                  <td>Unassigned</td>
                  <td>costa@example.com</td>
                  <td>1 year ago</td>
                  <td>71288</td>
                </tr></tbody>
            </table><div class="dataTables_info" id="datatable_info" role="status" aria-live="polite">Showing 1 to 8 of 17 entries</div></div>
          </div>
          <!-- End Table -->

          <!-- Footer -->
          <div class="card-footer">
            <!-- Pagination -->
            <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
              <div class="col-sm mb-2 mb-sm-0">
                <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                  <span class="mr-2">Showing:</span>

                  <!-- Select -->
                  <select id="datatableEntries" class="js-select2-custom select2-hidden-accessible" data-hs-select2-options="{
                            &quot;minimumResultsForSearch&quot;: &quot;Infinity&quot;,
                            &quot;customClass&quot;: &quot;custom-select custom-select-sm custom-select-borderless&quot;,
                            &quot;dropdownAutoWidth&quot;: true,
                            &quot;width&quot;: true
                          }" data-select2-id="datatableEntries" tabindex="-1" aria-hidden="true">
                    <option value="4" data-select2-id="13">4</option>
                    <option value="6" data-select2-id="14">6</option>
                    <option value="8" selected="" data-select2-id="15">8</option>
                    <option value="12" data-select2-id="16">12</option>
                  </select><span class="select2 select2-container select2-container--default" dir="ltr" data-select2-id="12"><span class="selection"><span class="select2-selection custom-select custom-select-sm custom-select-borderless" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-disabled="false" aria-labelledby="select2-datatableEntries-container"><span class="select2-selection__rendered" id="select2-datatableEntries-container" role="textbox" aria-readonly="true" title="8"><span>8</span></span><span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span class="dropdown-wrapper" aria-hidden="true"></span></span>
                  <!-- End Select -->

                  <span class="text-secondary mr-2">of</span>

                  <!-- Pagination Quantity -->
                  <span id="datatableWithPaginationInfoTotalQty">17</span>
                </div>
              </div>

              <div class="col-sm-auto">
                <div class="d-flex justify-content-center justify-content-sm-end">
                  <!-- Pagination -->
                  <nav id="datatablePagination" aria-label="Activity pagination"><div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate"><ul id="datatable_pagination" class="pagination datatable-custom-pagination"><li class="paginate_item page-item disabled"><a class="paginate_button previous page-link" aria-controls="datatable" data-dt-idx="0" tabindex="0" id="datatable_previous"><span aria-hidden="true">Prev</span></a></li><li class="paginate_item page-item active"><a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="1" tabindex="0">1</a></li><li class="paginate_item page-item"><a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="2" tabindex="0">2</a></li><li class="paginate_item page-item"><a class="paginate_button page-link" aria-controls="datatable" data-dt-idx="3" tabindex="0">3</a></li><li class="paginate_item page-item"><a class="paginate_button next page-link" aria-controls="datatable" data-dt-idx="4" tabindex="0" id="datatable_next"><span aria-hidden="true">Next</span></a></li></ul></div></nav>
                </div>
              </div>
            </div>
            <!-- End Pagination -->
          </div>
          <!-- End Footer -->
        </div>
        <!-- End Card -->

        <div class="row gx-2 gx-lg-3">
          <div class="col-lg-6 mb-3 mb-lg-0">
            <!-- Card -->
            <div class="card h-100">
              <!-- Header -->
              <div class="card-header">
                <h5 class="card-header-title">Transactions</h5>

                <!-- Daterangepicker -->
                <button id="js-daterangepicker-predefined" class="btn btn-sm btn-ghost-secondary dropdown-toggle">
                  <i class="tio-date-range"></i>
                  <span class="js-daterangepicker-predefined-preview ml-1">Dec 14 - Dec 14, 2021</span>
                </button>
                <!-- End Daterangepicker -->
              </div>
              <!-- End Header -->

              <!-- Body -->
              <div class="card-body">
                <!-- Chart -->
                <div class="chartjs-custom mx-auto" style="height: 20rem;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                  <canvas class="js-chart-datalabels chartjs-render-monitor" data-hs-chartjs-options="{
                            &quot;type&quot;: &quot;bubble&quot;,
                            &quot;data&quot;: {
                              &quot;datasets&quot;: [
                                {
                                  &quot;label&quot;: &quot;Label 1&quot;,
                                  &quot;data&quot;: [
                                    {&quot;x&quot;: 55, &quot;y&quot;: 65, &quot;r&quot;: 99}
                                  ],
                                  &quot;color&quot;: &quot;#fff&quot;,
                                  &quot;backgroundColor&quot;: &quot;rgba(55,125,255,.9)&quot;,
                                  &quot;borderColor&quot;: &quot;transparent&quot;
                                },
                                {
                                  &quot;label&quot;: &quot;Label 2&quot;,
                                  &quot;data&quot;: [
                                    {&quot;x&quot;: 33, &quot;y&quot;: 42, &quot;r&quot;: 65}
                                  ],
                                  &quot;color&quot;: &quot;#fff&quot;,
                                  &quot;backgroundColor&quot;: &quot;rgba(100, 0, 214, 0.8)&quot;,
                                  &quot;borderColor&quot;: &quot;transparent&quot;
                                },
                                {
                                  &quot;label&quot;: &quot;Label 3&quot;,
                                  &quot;data&quot;: [
                                    {&quot;x&quot;: 46, &quot;y&quot;: 26, &quot;r&quot;: 38}
                                  ],
                                  &quot;color&quot;: &quot;#fff&quot;,
                                  &quot;backgroundColor&quot;: &quot;#00c9db&quot;,
                                  &quot;borderColor&quot;: &quot;transparent&quot;
                                }
                              ]
                            },
                            &quot;options&quot;: {
                              &quot;scales&quot;: {
                                &quot;yAxes&quot;: [{
                                  &quot;gridLines&quot;: {
                                    &quot;display&quot;: false
                                  },
                                  &quot;ticks&quot;: {
                                    &quot;display&quot;: false,
                                    &quot;max&quot;: 100,
                                    &quot;beginAtZero&quot;: true
                                  }
                                }],
                                &quot;xAxes&quot;: [{
                                &quot;gridLines&quot;: {
                                    &quot;display&quot;: false
                                  },
                                  &quot;ticks&quot;: {
                                    &quot;display&quot;: false,
                                    &quot;max&quot;: 100,
                                    &quot;beginAtZero&quot;: true
                                  }
                                }]
                              },
                              &quot;tooltips&quot;: false
                            }
                          }" width="712" height="480" style="display: block; height: 320px; width: 475px;"></canvas>
                </div>
                <!-- End Chart -->

                <!-- Legend Indicators -->
                <div class="row justify-content-center">
                  <div class="col-auto">
                    <span class="legend-indicator bg-primary"></span> New
                  </div>

                  <div class="col-auto">
                    <span class="legend-indicator" style="background-color: #7000f2;"></span> Pending
                  </div>

                  <div class="col-auto">
                    <span class="legend-indicator bg-info"></span> Failed
                  </div>
                </div>
                <!-- End Legend Indicators -->
              </div>
              <!-- End Body -->
            </div>
            <!-- End Card -->
          </div>

          <div class="col-lg-6">
            <!-- Card -->
            <div class="card h-100">
              <!-- Header -->
              <div class="card-header">
                <h5 class="card-header-title">Reports overview</h5>

                <!-- Unfold -->
                <div class="hs-unfold">
                  <a class="js-hs-unfold-invoker btn btn-icon btn-sm btn-ghost-secondary rounded-circle" href="javascript:;" data-hs-unfold-options="{
                       &quot;target&quot;: &quot;#reportsOverviewDropdown1&quot;,
                       &quot;type&quot;: &quot;css-animation&quot;
                     }" data-hs-unfold-target="#reportsOverviewDropdown1" data-hs-unfold-invoker="">
                    <i class="tio-more-vertical"></i>
                  </a>

                  <div id="reportsOverviewDropdown1" class="hs-unfold-content dropdown-unfold dropdown-menu dropdown-menu-right mt-1 hs-unfold-hidden hs-unfold-content-initialized hs-unfold-css-animation animated hs-unfold-reverse-y" data-hs-target-height="248" data-hs-unfold-content="" data-hs-unfold-content-animation-in="slideInUp" data-hs-unfold-content-animation-out="fadeOut" style="animation-duration: 300ms;">
                    <span class="dropdown-header">Settings</span>

                    <a class="dropdown-item" href="#">
                      <i class="tio-share dropdown-item-icon"></i> Share reports
                    </a>
                    <a class="dropdown-item" href="#">
                      <i class="tio-download-to dropdown-item-icon"></i> Download
                    </a>
                    <a class="dropdown-item" href="#">
                      <i class="tio-alt dropdown-item-icon"></i> Connect other apps
                    </a>

                    <div class="dropdown-divider"></div>

                    <span class="dropdown-header">Feedback</span>

                    <a class="dropdown-item" href="#">
                      <i class="tio-chat-outlined dropdown-item-icon"></i> Report
                    </a>
                  </div>
                </div>
                <!-- End Unfold -->
              </div>
              <!-- End Header -->

              <!-- Body -->
              <div class="card-body">
                <span class="h1 d-block mb-4">$7,431.14 USD</span>

                <!-- Progress -->
                <div class="progress rounded-pill mb-2">
                  <div class="progress-bar" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="" data-original-title="Gross value"></div>
                  <div class="progress-bar opacity" role="progressbar" style="width: 33%" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="" data-original-title="Net volume from sales"></div>
                  <div class="progress-bar opacity-xs" role="progressbar" style="width: 9%" aria-valuenow="9" aria-valuemin="0" aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="" data-original-title="New volume from sales"></div>
                </div>

                <div class="d-flex justify-content-between mb-4">
                  <span>0%</span>
                  <span>100%</span>
                </div>
                <!-- End Progress -->

                <!-- Table -->
                <div class="table-responsive">
                  <table class="table table-lg table-nowrap card-table mb-0">
                    <tbody><tr>
                      <th scope="row">
                        <span class="legend-indicator bg-primary"></span>Gross value
                      </th>
                      <td>$3,500.71</td>
                      <td>
                        <span class="badge badge-soft-success">+12.1%</span>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                        <span class="legend-indicator bg-primary opacity"></span>Net volume from sales
                      </th>
                      <td>$2,980.45</td>
                      <td>
                        <span class="badge badge-soft-warning">+6.9%</span>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                        <span class="legend-indicator bg-primary opacity-xs"></span>New volume from sales
                      </th>
                      <td>$950.00</td>
                      <td>
                        <span class="badge badge-soft-danger">-1.5%</span>
                      </td>
                    </tr>

                    <tr>
                      <th scope="row">
                        <span class="legend-indicator"></span>Other
                      </th>
                      <td>32</td>
                      <td>
                        <span class="badge badge-soft-success">1.9%</span>
                      </td>
                    </tr>
                  </tbody></table>
                </div>
                <!-- End Table -->
              </div>
              <!-- End Body -->
            </div>
            <!-- End Card -->
          </div>
        </div>
      </div>


</body>
</html>