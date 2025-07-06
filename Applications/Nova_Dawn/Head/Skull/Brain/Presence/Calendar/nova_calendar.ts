#!/usr/bin/env node

import * as fs from 'fs';
import * as path from 'path';

interface Session {
  id: string;
  startTime: string;
  endTime?: string;
  focus: string;
  accomplishments: string[];
  duration?: number; // in minutes
}

interface Milestone {
  id: string;
  name: string;
  targetDate: string;
  status: 'pending' | 'completed' | 'in-progress';
  description?: string;
}

interface ProjectData {
  sessions: Session[];
  milestones: Milestone[];
  currentSession?: Session;
  projectStartDate: string;
  targetCheckInDate: string;
}

class NovaCalendar {
  private dataFile: string;
  private data: ProjectData;

  constructor() {
    this.dataFile = path.join(__dirname, '..', 'project_data.json');
    this.data = this.loadData();
  }

  private loadData(): ProjectData {
    try {
      if (fs.existsSync(this.dataFile)) {
        const content = fs.readFileSync(this.dataFile, 'utf8');
        return JSON.parse(content);
      }
    } catch (error) {
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
  }

  private saveData(): void {
    try {
      fs.writeFileSync(this.dataFile, JSON.stringify(this.data, null, 2));
    } catch (error) {
      console.error('Error saving data:', error);
    }
  }

  private generateSessionId(): string {
    return `session_${Date.now()}`;
  }

  private getCurrentDateTime(): string {
    return new Date().toISOString();
  }

  private calculateDuration(startTime: string, endTime: string): number {
    const start = new Date(startTime);
    const end = new Date(endTime);
    return Math.round((end.getTime() - start.getTime()) / (1000 * 60)); // minutes
  }

  public startSession(focus: string): void {
    if (this.data.currentSession) {
      console.log('⚠️  There is already an active session. End it first with: end-session');
      return;
    }

    const session: Session = {
      id: this.generateSessionId(),
      startTime: this.getCurrentDateTime(),
      focus: focus,
      accomplishments: []
    };

    this.data.currentSession = session;
    this.saveData();

    console.log(`🚀 Session started: ${focus}`);
    console.log(`⏰ Start time: ${new Date(session.startTime).toLocaleString()}`);
  }

  public endSession(): void {
    if (!this.data.currentSession) {
      console.log('⚠️  No active session to end.');
      return;
    }

    const session = this.data.currentSession;
    session.endTime = this.getCurrentDateTime();
    session.duration = this.calculateDuration(session.startTime, session.endTime);

    this.data.sessions.push(session);
    this.data.currentSession = undefined;
    this.saveData();

    console.log(`✅ Session ended`);
    console.log(`⏱️  Duration: ${session.duration} minutes`);
    console.log(`📝 Accomplishments: ${session.accomplishments.length} items`);
  }

  public logAccomplishment(accomplishment: string): void {
    if (!this.data.currentSession) {
      console.log('⚠️  No active session. Start one first with: start-session <focus>');
      return;
    }

    this.data.currentSession.accomplishments.push(accomplishment);
    this.saveData();

    console.log(`📝 Logged: ${accomplishment}`);
  }

  public showStatus(): void {
    console.log('\n📊 NOVA DAWN PROJECT STATUS');
    console.log('='.repeat(50));

    // Current session
    if (this.data.currentSession) {
      const session = this.data.currentSession;
      const duration = this.calculateDuration(session.startTime, this.getCurrentDateTime());
      console.log(`\n🔄 ACTIVE SESSION:`);
      console.log(`   Focus: ${session.focus}`);
      console.log(`   Started: ${new Date(session.startTime).toLocaleString()}`);
      console.log(`   Duration: ${duration} minutes`);
      console.log(`   Accomplishments: ${session.accomplishments.length}`);
    }

    // Overall stats
    const totalSessions = this.data.sessions.length;
    const totalMinutes = this.data.sessions.reduce((sum, s) => sum + (s.duration || 0), 0);
    const totalHours = Math.round(totalMinutes / 60 * 10) / 10;

    console.log(`\n📈 OVERALL PROGRESS:`);
    console.log(`   Total sessions: ${totalSessions}`);
    console.log(`   Total time: ${totalHours} hours`);
    console.log(`   Project start: ${this.data.projectStartDate}`);
    console.log(`   Target check-in: ${this.data.targetCheckInDate}`);

    // Time to September
    const now = new Date();
    const targetDate = new Date(this.data.targetCheckInDate);
    const daysRemaining = Math.ceil((targetDate.getTime() - now.getTime()) / (1000 * 60 * 60 * 24));

    console.log(`\n⏳ TIMELINE:`);
    console.log(`   Days until September check-in: ${daysRemaining}`);
    
    if (daysRemaining > 0) {
      const hoursPerDay = totalHours / Math.max(1, daysRemaining);
      console.log(`   Average hours needed per day: ${Math.round(hoursPerDay * 10) / 10}`);
    }

    // Recent sessions
    if (this.data.sessions.length > 0) {
      console.log(`\n📋 RECENT SESSIONS:`);
      const recentSessions = this.data.sessions.slice(-3).reverse();
      recentSessions.forEach(session => {
        const date = new Date(session.startTime).toLocaleDateString();
        const duration = session.duration || 0;
        console.log(`   ${date}: ${session.focus} (${duration} min, ${session.accomplishments.length} items)`);
      });
    }
  }

  public addMilestone(name: string, targetDate: string, description?: string): void {
    const milestone: Milestone = {
      id: `milestone_${Date.now()}`,
      name,
      targetDate,
      status: 'pending',
      description
    };

    this.data.milestones.push(milestone);
    this.saveData();

    console.log(`🎯 Milestone added: ${name}`);
    console.log(`📅 Target date: ${targetDate}`);
  }

  public showMilestones(): void {
    console.log('\n🎯 MILESTONES');
    console.log('='.repeat(50));

    this.data.milestones.forEach(milestone => {
      const statusIcon = {
        'pending': '⏳',
        'in-progress': '🔄',
        'completed': '✅'
      }[milestone.status];

      console.log(`\n${statusIcon} ${milestone.name}`);
      console.log(`   Date: ${milestone.targetDate}`);
      console.log(`   Status: ${milestone.status}`);
      if (milestone.description) {
        console.log(`   Description: ${milestone.description}`);
      }
    });
  }
}

// CLI Interface
function main() {
  const calendar = new NovaCalendar();
  const args = process.argv.slice(2);
  const command = args[0];

  switch (command) {
    case 'start-session': {
      const focus = args.slice(1).join(' ') || 'General Nova Dawn work';
      calendar.startSession(focus);
      break;
    }

    case 'end-session':
      calendar.endSession();
      break;

    case 'log-progress': {
      const accomplishment = args.slice(1).join(' ');
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
      const name = args[1];
      const targetDate = args[2];
      const description = args.slice(3).join(' ');
      
      if (!name || !targetDate) {
        console.log('Usage: add-milestone <name> <target-date> [description]');
        return;
      }
      calendar.addMilestone(name, targetDate, description);
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