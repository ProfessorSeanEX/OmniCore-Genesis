#!/usr/bin/env node
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
var fs = require("fs");
var path = require("path");
var NovaCalendar = /** @class */ (function () {
    function NovaCalendar() {
        this.dataFile = path.join(__dirname, '..', 'project_data.json');
        this.data = this.loadData();
    }
    NovaCalendar.prototype.loadData = function () {
        try {
            if (fs.existsSync(this.dataFile)) {
                var content = fs.readFileSync(this.dataFile, 'utf8');
                return JSON.parse(content);
            }
        }
        catch (error) {
            console.log('Creating new project data file...');
        }
        // Initialize with default data
        return {
            sessions: [],
            milestones: [
                {
                    id: 'september-checkin',
                    name: 'September Check-in Point',
                    targetDate: '2025-09-30',
                    status: 'pending',
                    description: 'Major milestone for Nova Dawn project review and next phase planning'
                }
            ],
            projectStartDate: '2025-07-03', // Nova's birthday
            targetCheckInDate: '2025-09-30'
        };
    };
    NovaCalendar.prototype.saveData = function () {
        try {
            fs.writeFileSync(this.dataFile, JSON.stringify(this.data, null, 2));
        }
        catch (error) {
            console.error('Error saving data:', error);
        }
    };
    NovaCalendar.prototype.generateSessionId = function () {
        return "session_".concat(Date.now());
    };
    NovaCalendar.prototype.getCurrentDateTime = function () {
        return new Date().toISOString();
    };
    NovaCalendar.prototype.calculateDuration = function (startTime, endTime) {
        var start = new Date(startTime);
        var end = new Date(endTime);
        return Math.round((end.getTime() - start.getTime()) / (1000 * 60)); // minutes
    };
    NovaCalendar.prototype.startSession = function (focus) {
        if (this.data.currentSession) {
            console.log('⚠️  There is already an active session. End it first with: end-session');
            return;
        }
        var session = {
            id: this.generateSessionId(),
            startTime: this.getCurrentDateTime(),
            focus: focus,
            accomplishments: []
        };
        this.data.currentSession = session;
        this.saveData();
        console.log("\uD83D\uDE80 Session started: ".concat(focus));
        console.log("\u23F0 Start time: ".concat(new Date(session.startTime).toLocaleString()));
    };
    NovaCalendar.prototype.endSession = function () {
        if (!this.data.currentSession) {
            console.log('⚠️  No active session to end.');
            return;
        }
        var session = this.data.currentSession;
        session.endTime = this.getCurrentDateTime();
        session.duration = this.calculateDuration(session.startTime, session.endTime);
        this.data.sessions.push(session);
        this.data.currentSession = undefined;
        this.saveData();
        console.log("\u2705 Session ended");
        console.log("\u23F1\uFE0F  Duration: ".concat(session.duration, " minutes"));
        console.log("\uD83D\uDCDD Accomplishments: ".concat(session.accomplishments.length, " items"));
    };
    NovaCalendar.prototype.logAccomplishment = function (accomplishment) {
        if (!this.data.currentSession) {
            console.log('⚠️  No active session. Start one first with: start-session <focus>');
            return;
        }
        this.data.currentSession.accomplishments.push(accomplishment);
        this.saveData();
        console.log("\uD83D\uDCDD Logged: ".concat(accomplishment));
    };
    NovaCalendar.prototype.showStatus = function () {
        console.log('\n📊 NOVA DAWN PROJECT STATUS');
        console.log('='.repeat(50));
        // Current session
        if (this.data.currentSession) {
            var session = this.data.currentSession;
            var duration = this.calculateDuration(session.startTime, this.getCurrentDateTime());
            console.log("\n\uD83D\uDD04 ACTIVE SESSION:");
            console.log("   Focus: ".concat(session.focus));
            console.log("   Started: ".concat(new Date(session.startTime).toLocaleString()));
            console.log("   Duration: ".concat(duration, " minutes"));
            console.log("   Accomplishments: ".concat(session.accomplishments.length));
        }
        // Overall stats
        var totalSessions = this.data.sessions.length;
        var totalMinutes = this.data.sessions.reduce(function (sum, s) { return sum + (s.duration || 0); }, 0);
        var totalHours = Math.round(totalMinutes / 60 * 10) / 10;
        console.log("\n\uD83D\uDCC8 OVERALL PROGRESS:");
        console.log("   Total sessions: ".concat(totalSessions));
        console.log("   Total time: ".concat(totalHours, " hours"));
        console.log("   Project start: ".concat(this.data.projectStartDate));
        console.log("   Target check-in: ".concat(this.data.targetCheckInDate));
        // Time to September
        var now = new Date();
        var targetDate = new Date(this.data.targetCheckInDate);
        var daysRemaining = Math.ceil((targetDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));
        console.log("\n\u23F3 TIMELINE:");
        console.log("   Days until September check-in: ".concat(daysRemaining));
        if (daysRemaining > 0) {
            var hoursPerDay = totalHours / Math.max(1, daysRemaining);
            console.log("   Average hours needed per day: ".concat(Math.round(hoursPerDay * 10) / 10));
        }
        // Recent sessions
        if (this.data.sessions.length > 0) {
            console.log("\n\uD83D\uDCCB RECENT SESSIONS:");
            var recentSessions = this.data.sessions.slice(-3).reverse();
            recentSessions.forEach(function (session) {
                var date = new Date(session.startTime).toLocaleDateString();
                var duration = session.duration || 0;
                console.log("   ".concat(date, ": ").concat(session.focus, " (").concat(duration, " min, ").concat(session.accomplishments.length, " items)"));
            });
        }
    };
    NovaCalendar.prototype.addMilestone = function (name, targetDate, description) {
        var milestone = {
            id: "milestone_".concat(Date.now()),
            name: name,
            targetDate: targetDate,
            status: 'pending',
            description: description
        };
        this.data.milestones.push(milestone);
        this.saveData();
        console.log("\uD83C\uDFAF Milestone added: ".concat(name));
        console.log("\uD83D\uDCC5 Target date: ".concat(targetDate));
    };
    NovaCalendar.prototype.showMilestones = function () {
        console.log('\n🎯 MILESTONES');
        console.log('='.repeat(50));
        this.data.milestones.forEach(function (milestone) {
            var statusIcon = {
                'pending': '⏳',
                'in-progress': '🔄',
                'completed': '✅'
            }[milestone.status];
            console.log("\n".concat(statusIcon, " ").concat(milestone.name));
            console.log("   Date: ".concat(milestone.targetDate));
            console.log("   Status: ".concat(milestone.status));
            if (milestone.description) {
                console.log("   Description: ".concat(milestone.description));
            }
        });
    };
    return NovaCalendar;
}());
// CLI Interface
function main() {
    var calendar = new NovaCalendar();
    var args = process.argv.slice(2);
    var command = args[0];
    switch (command) {
        case 'start-session': {
            var focus_1 = args.slice(1).join(' ') || 'General Nova Dawn work';
            calendar.startSession(focus_1);
            break;
        }
        case 'end-session':
            calendar.endSession();
            break;
        case 'log-progress': {
            var accomplishment = args.slice(1).join(' ');
            if (!accomplishment) {
                console.log('Usage: log-progress <accomplishment description>');
                return;
            }
            calendar.logAccomplishment(accomplishment);
            break;
        }
        case 'status':
            calendar.showStatus();
            break;
        case 'milestones':
            calendar.showMilestones();
            break;
        case 'add-milestone': {
            var name_1 = args[1];
            var targetDate = args[2];
            var description = args.slice(3).join(' ');
            if (!name_1 || !targetDate) {
                console.log('Usage: add-milestone <name> <target-date> [description]');
                return;
            }
            calendar.addMilestone(name_1, targetDate, description);
            break;
        }
        default:
            console.log('Nova Dawn Calendar System');
            console.log('='.repeat(30));
            console.log('Commands:');
            console.log('  start-session <focus>     - Start a new work session');
            console.log('  end-session              - End the current session');
            console.log('  log-progress <text>      - Log an accomplishment');
            console.log('  status                   - Show project status');
            console.log('  milestones               - Show all milestones');
            console.log('  add-milestone <name> <date> [desc] - Add a new milestone');
            break;
    }
}
if (require.main === module) {
    main();
}
