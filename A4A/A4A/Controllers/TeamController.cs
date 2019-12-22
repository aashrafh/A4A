﻿using A4A.DataAccess;
using A4A.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace A4A.Controllers
{
    public class TeamController : Controller
    {
        public ActionResult Index()
        {
            return RedirectToAction("ViewAllTeams");
        }
        public ActionResult CreateTeam(int id, string UserName)
        {
            ViewBag.id = id;
            ViewBag.UserName = UserName;
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateTeam(TeamModel TM)
        {
            DBController db = new DBController();

            TM.TeamID = db.Count_Teams() + 1;

            db.InsertTeam(TM);
            db.InsertTeamMembers(TM.TeamID, db.Select_Id_by_Email(TM.TeamMembers[1]));
            db.InsertTeamMembers(TM.TeamID, db.Select_Id_by_Email(TM.TeamMembers[2]));

            return View();
        }
        public ActionResult ViewAllTeams(int id=0, string UserName="")
        {
            DBController dbController = new DBController();
            DataTable dt = dbController.SelectTeams();

            List<TeamModel> Teams = new List<TeamModel>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                TeamModel Team = new TeamModel();
                Team.TeamName = Convert.ToString(dt.Rows[i]["TeamName"]);
                Team.TeamID = int.Parse(Convert.ToString(dt.Rows[i]["TeamID"]));
                Team.LeaderID = Convert.ToInt32(dt.Rows[i]["LeaderID"]);

                Teams.Add(Team);
            }

            ViewBag.id = id;
            ViewBag.UserName = UserName;

            return View(Teams);
        }
        public ActionResult ViewGroupTeams(int GroupID)
        {
            DBController dbController = new DBController();
            DataTable dt = dbController.SelectMyGroups(GroupID);
            List<TeamModel> Teams = new List<TeamModel>();
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                TeamModel Team = new TeamModel();
                Team.TeamName = Convert.ToString(dt.Rows[i]["TeamName"]);
                Team.TeamID = int.Parse(Convert.ToString(dt.Rows[i]["TeamID"]));
                Team.LeaderID = Convert.ToInt32(dt.Rows[i]["LeaderID"]);

                Teams.Add(Team);
            }
            return View(Teams);
        }
        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult TeamOptions()
        {
            return View();
        }
        public ActionResult SuccessfulCreationOfTeam()
        {
            return View();
        }
    }
}
