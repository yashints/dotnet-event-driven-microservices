using EDAM.Core.Interfaces;
using EDAM.Scheduling.Domain.Interfaces;

namespace EDAM.Scheduling.Domain.Events
{
    public class CameraMaintenanceScheduleChangedEvent : IDomainEvent, ICameraMaintenanceScheduleInfo
    {
        public string? DomainData { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public int CameraId => throw new NotImplementedException();
        public int MaintenanceScheduleId { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
        public string CronExpression { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }
    }
}
